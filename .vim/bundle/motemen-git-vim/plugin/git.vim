" Author:  motemen <motemen@gmail.com>
" License: The MIT License
" URL:     http://github.com/motemen/git-vim/

if !exists('g:git_command_edit')
    let g:git_command_edit = 'new'
endif

if !exists('g:git_bufhidden')
    let g:git_bufhidden = ''
endif

if !exists('g:git_bin')
    let g:git_bin = 'git'
endif

if !exists('g:git_author_highlight')
    let g:git_author_highlight = { }
endif

if !exists('g:git_highlight_blame')
    let g:git_highlight_blame = 0
endif

if !exists('g:git_no_map_default') || !g:git_no_map_default
    nnoremap <Leader>gd :GitDiff<Enter>
    nnoremap <Leader>gD :GitDiff --cached<Enter>
    nnoremap <Leader>gs :GitStatus<Enter>
    nnoremap <Leader>gl :GitLog<Enter>
    nnoremap <Leader>ga :GitAdd<Enter>
    nnoremap <Leader>gA :GitAdd <cfile><Enter>
    nnoremap <Leader>gc :GitCommit<Enter>
    nnoremap <Leader>gp :GitPullRebase<Enter>
    nnoremap <Leader>gb :GitBlame<Enter>
endif

" Ensure b:git_dir exists.
function! s:GetGitDir()
    if !exists('b:git_dir')
        let b:git_dir = s:SystemGit('rev-parse --git-dir')
        if !v:shell_error
            let b:git_dir = fnamemodify(split(b:git_dir, "\n")[0], ':p') . '/'
        endif
    endif
    return b:git_dir
endfunction

" Returns current git branch.
" Call inside 'statusline' or 'titlestring'.
function! GitBranch()
    let git_dir = <SID>GetGitDir()

    if strlen(git_dir) && filereadable(git_dir . '/HEAD')
        let lines = readfile(git_dir . '/HEAD')
        if !len(lines)
            return ''
        else
            return matchstr(lines[0], 'refs/heads/\zs.\+$')
        endif
    else
        return ''
    endif
endfunction

" List all git local branches.
function! ListGitBranches(arg_lead, cmd_line, cursor_pos)
    let branches = split(s:SystemGit('branch'), '\n')
    if v:shell_error
        return []
    endif

    return map(branches, 'matchstr(v:val, ''^[* ] \zs.*'')')
endfunction

" List all git commits.
function! ListGitCommits(arg_lead, cmd_line, cursor_pos)
    let commits = split(s:SystemGit('log --pretty=format:%h'))
    if v:shell_error
        return []
    endif

    let commits = ['HEAD'] + ListGitBranches(a:arg_lead, a:cmd_line, a:cursor_pos) + commits

    if a:cmd_line =~ '^GitDiff'
        " GitDiff accepts <commit>..<commit>
        if a:arg_lead =~ '\.\.'
            let pre = matchstr(a:arg_lead, '.*\.\.\ze')
            let commits = map(commits, 'pre . v:val')
        endif
    endif

    return filter(commits, 'match(v:val, ''\v'' . a:arg_lead) == 0')
endfunction

" Show diff.
function! GitDiff(args)
    let git_output = s:SystemGit('diff ' . a:args . ' -- ' . s:Expand('%'))
    if !strlen(git_output)
        echo "No output from git command"
        return
    endif

    call <SID>OpenGitBuffer(git_output)
    setlocal filetype=git-diff
endfunction

" Show Status.
function! GitStatus()
    let git_output = s:SystemGit('status')
    call <SID>OpenGitBuffer(git_output)
    setlocal filetype=git-status
    nnoremap <buffer> <Enter> :GitAdd <cfile><Enter>:call <SID>RefreshGitStatus()<Enter>
    nnoremap <buffer> -       :silent !git reset HEAD -- =expand('<cfile>')<Enter><Enter>:call <SID>RefreshGitStatus()<Enter>
endfunction

function! s:RefreshGitStatus()
    let pos_save = getpos('.')
    GitStatus
    call setpos('.', pos_save)
endfunction

" Show Log.
function! GitLog(args)
    let git_output = s:SystemGit('log ' . a:args . ' -- ' . s:Expand('%'))
    call <SID>OpenGitBuffer(git_output)
    setlocal filetype=git-log
endfunction

" Add file to index.
function! GitAdd(expr)
    let file = s:Expand(strlen(a:expr) ? a:expr : '%')

    call GitDoCommand('add ' . file)
endfunction

" Commit.
function! GitCommit(args)
    let git_dir = <SID>GetGitDir()

    let args = a:args

    if args !~ '\v\k@<!(-a|--all)>' && s:SystemGit('diff --cached --stat') =~ '^\(\s\|\n\)*$'
        let args .= ' -a'
    endif

    " Create COMMIT_EDITMSG file
    let editor_save = $EDITOR
    let $EDITOR = ''
    let git_output = s:SystemGit('commit ' . args)
    let $EDITOR = editor_save

    let cur_dir = getcwd()
    execute printf('%s %sCOMMIT_EDITMSG', g:git_command_edit, git_dir)
    execute printf("lcd %s", cur_dir)

    setlocal filetype=git-status bufhidden=wipe
    augroup GitCommit
        autocmd BufWritePre  <buffer> g/^#\|^\s*$/d | setlocal fileencoding=utf-8
        execute printf("autocmd BufEnter <buffer> lcd %s", cur_dir)
        execute printf("autocmd BufWritePost <buffer> call GitDoCommand('commit %s -F ' . expand('%%')) | autocmd! GitCommit * <buffer>", args)
    augroup END
endfunction

" Checkout.
function! GitCheckout(args)
    call GitDoCommand('checkout ' . a:args)
endfunction

" Push.
function! GitPush(args)
"   call GitDoCommand('push ' . a:args)
    " Wanna see progress...
    let args = a:args
    if args =~ '^\s*$'
        let args = 'origin ' . GitBranch()
    endif
    execute '!' g:git_bin 'push' args
endfunction

" Pull.
function! GitPull(args)
"   call GitDoCommand('pull ' . a:args)
    " Wanna see progress...
    execute '!' g:git_bin 'pull' a:args
endfunction

" Show commit, tree, blobs.
function! GitCatFile(file)
    let file = s:Expand(a:file)
    let git_output = s:SystemGit('cat-file -p ' . file)
    if !strlen(git_output)
        echo "No output from git command"
        return
    endif

    call <SID>OpenGitBuffer(git_output)
endfunction

" Show revision and author for each line.
function! GitBlame(...)
    let git_output = s:SystemGit('blame -- ' . expand('%'))
    if !strlen(git_output)
        echo "No output from git command"
        return
    endif

    let l:git_blame_width = 20
    if strlen(a:1)
        let l:git_blame_width = a:1
    elseif exists('g:git_blame_width') && g:git_blame_width
        let l:git_blame_width = g:git_blame_width
    endif

    setlocal noscrollbind

    " :/
    let git_command_edit_save = g:git_command_edit
    let g:git_command_edit = 'leftabove vnew'
    call <SID>OpenGitBuffer(git_output)
    let g:git_command_edit = git_command_edit_save

    setlocal modifiable
    silent %s/\d\d\d\d\zs \+\d\+).*//
    exe 'vertical resize ' . git_blame_width
    setlocal nomodifiable
    setlocal nowrap scrollbind

    if g:git_highlight_blame
        call s:DoHighlightGitBlame()
    endif

    wincmd p
    setlocal nowrap scrollbind

    syncbind
endfunction

" Experimental
function! s:DoHighlightGitBlame()
    for l in range(1, line('$'))
        let line = getline(l)
        let [commit, author] = matchlist(line, '\(\x\+\) (\(.\{-}\)\s* \d\d\d\d-\d\d-\d\d')[1:2]
        call s:LoadSyntaxRuleFor({ 'author': author })
    endfor
endfunction

function! s:LoadSyntaxRuleFor(params)
    let author = a:params.author
    let name = 'gitBlameAuthor_' . substitute(author, '\s', '_', 'g')
    if (!hlID(name))
        if has_key(g:git_author_highlight, author)
            execute 'highlight' name g:git_author_highlight[author]
        else
            let [n1, n2] = [0, 1]
            for c in split(author, '\zs')
                let n1 = (n1 + char2nr(c))     % 8
                let n2 = (n2 + char2nr(c) * 3) % 8
            endfor
            if n1 == n2
                let n1 = (n2 + 1) % 8
            endif
            execute 'highlight' name printf('ctermfg=%d ctermbg=%d', n1, n2)
        endif
        execute 'syntax match' name '"\V\^\x\+ (' . escape(author, '\') . '\.\*"'
    endif
endfunction

function! GitDoCommand(args)
    let git_output = s:SystemGit(a:args)
    let git_output = substitute(git_output, '\n*$', '', '')
    if v:shell_error
        echohl Error
        echo git_output
        echohl None
    else
        echo git_output
    endif
endfunction

function! s:SystemGit(args)
    " workardound for MacVim, on which shell does not inherit environment
    " variables
    if has('mac') && &shell =~ 'sh$'
        return system('EDITOR="" '. g:git_bin . ' ' . a:args)
    else
        return system(g:git_bin . ' ' . a:args)
    endif
endfunction

" Show vimdiff for merge. (experimental)
function! GitVimDiffMerge()
    let file = s:Expand('%')
    let filetype = &filetype
    let t:git_vimdiff_original_bufnr = bufnr('%')
    let t:git_vimdiff_buffers = []

    topleft new
    setlocal buftype=nofile
    file `=':2:' . file`
    call add(t:git_vimdiff_buffers, bufnr('%'))
    execute 'silent read!git show :2:' . file
    0d
    diffthis
    let &filetype = filetype

    rightbelow vnew
    setlocal buftype=nofile
    file `=':3:' . file`
    call add(t:git_vimdiff_buffers, bufnr('%'))
    execute 'silent read!git show :3:' . file
    0d
    diffthis
    let &filetype = filetype
endfunction

function! GitVimDiffMergeDone()
    if exists('t:git_vimdiff_original_bufnr') && exists('t:git_vimdiff_buffers')
        if getbufline(t:git_vimdiff_buffers[0], 1, '$') == getbufline(t:git_vimdiff_buffers[1], 1, '$')
            execute 'sbuffer ' . t:git_vimdiff_original_bufnr
            0put=getbufline(t:git_vimdiff_buffers[0], 1, '$')
            normal! jdG
            update
            execute 'bdelete ' . t:git_vimdiff_buffers[0]
            execute 'bdelete ' . t:git_vimdiff_buffers[1]
            close
        else
            echohl Error
            echo 'There still remains conflict'
            echohl None
        endif
    endif
endfunction

function! s:OpenGitBuffer(content)
    if exists('b:is_git_msg_buffer') && b:is_git_msg_buffer
        enew!
    else
        execute g:git_command_edit
    endif

    setlocal buftype=nofile readonly modifiable
    execute 'setlocal bufhidden=' . g:git_bufhidden

    silent put=a:content
    keepjumps 0d
    setlocal nomodifiable

    let b:is_git_msg_buffer = 1
endfunction

function! s:Expand(expr)
    if has('win32')
        return substitute(expand(a:expr), '\', '/', 'g')
    else
        return expand(a:expr)
    endif
endfunction

command! -nargs=1 -complete=customlist,ListGitCommits GitCheckout call GitCheckout(<q-args>)
command! -nargs=* -complete=customlist,ListGitCommits GitDiff     call GitDiff(<q-args>)
command!          GitStatus           call GitStatus()
command! -nargs=? GitAdd              call GitAdd(<q-args>)
command! -nargs=* GitLog              call GitLog(<q-args>)
command! -nargs=* GitCommit           call GitCommit(<q-args>)
command! -nargs=1 GitCatFile          call GitCatFile(<q-args>)
command! -nargs=? GitBlame            call GitBlame(<q-args>)
command! -nargs=+ Git                 call GitDoCommand(<q-args>)
command!          GitVimDiffMerge     call GitVimDiffMerge()
command!          GitVimDiffMergeDone call GitVimDiffMergeDone()
command! -nargs=* GitPull             call GitPull(<q-args>)
command!          GitPullRebase       call GitPull('--rebase')
command! -nargs=* GitPush             call GitPush(<q-args>)
