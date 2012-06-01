*git-vim.txt*  Git Bindings for Vim

==============================================================================
CONTENTS                                                    *git-vim-contents*

  1. Introduction.............................|git-vim|
  2. Commands.................................|git-vim-commands|
  3. Keymaps..................................|git-vim-keymaps|
  4. License..................................|git-vim-license|

==============================================================================
1. Introduction                                                      *git-vim*

Git-vim provides:

* Plugin files for calling git functions from inside Vim
* Syntax files for git displays

==============================================================================
2. Commands                                                 *git-vim-commands*

:GitAdd <file>
    git-add <file> or current file if not specified.

:GitCommit <args>
    git-commit.

:GitStatus
    Show git-status of current file or repository.

:GitLog
    Show git-log of current file or repository.

:GitCheckout <args>
    git-checkout. Completes git commits.

:GitDiff <args>
    git-diff. Completes git commits.

:GitPull <args>
    git-pull.

:GitPullRebase
    git-pull —rebase.

:GitPush <args>
    git-push. Defaults to +git push origin <current-branch>+.

:GitCatFile <args>
    git-cat-file.

:Git <args>
    Does any git command.

:GitVimDiffMerge
    Experimental. Call this command on unmerged file to enter vimdiff mode.

:GitVimDiffMergeDone
    Call this command after merging.

==============================================================================
3. Keymaps                                                   *git-vim-keymaps*

<Leader>gd
    :GitDiff

<Leader>gD
    :GitDiff —cached

<Leader>gs
    :GitStatus

<Leader>gl
    :GitLog

<Leader>ga
    :GitAdd

<Leader>gA
    :GitAdd <cfile>

<Leader>gc
    :GitCommit

In the git-status buffer:

<Enter>
    :GitAdd <cfile>

==============================================================================
4. License                                                   *git-vim-license*

The MIT License

 vim:tw=78:ts=8:ft=help
