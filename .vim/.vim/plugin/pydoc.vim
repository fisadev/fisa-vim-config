"pydoc.vim: pydoc integration for vim
"performs searches and can display the documentation of python modules
"Author: André Kelpe <fs111 at web dot de>
"http://www.vim.org/scripts/script.php?script_id=910
"This plugin integrates the pydoc into vim. You can view the
"documentation of a module by using :Pydoc foo.bar.baz or search
"a word (uses pydoc -k) in the documentation by typing PydocSearch
"foobar. You can also view the documentation of the word under the
"cursor by pressing <leader>pw or the WORD (see :help WORD) by pressing
"<leader>pW.  "This is very useful if you want to jump to a module which was found by
"PydocSearch. To have a browser like feeling you can use u and CTRL-R to
"go back and forward, just like editing normal text.

"If you want to use the script and pydoc is not in your PATH, just put a
"line like  

" let g:pydoc_cmd = \"/usr/bin/pydoc" (without the backslash!!)

"in your .vimrc


"pydoc.vim is free software, you can redistribute or modify
"it under the terms of the GNU General Public License Version 2 or any
"later Version (see http://www.gnu.org/copyleft/gpl.html for details). 

"Please feel free to contact me.


set switchbuf=useopen
function! ShowPyDoc(name, type)
	if !exists('g:pydoc_cmd')
		let g:pydoc_cmd = 'pydoc'
	endif
	if bufnr("__doc__") >0
			exe "sb __doc__"
	else
			exe 'split __doc__'
	endif
	setlocal noswapfile
	set buftype=nofile
	setlocal modifiable
	normal ggdG
	let s:name2 = substitute(a:name, '(.*', '', 'g' )
	if a:type==1
		execute  "silent read ! " g:pydoc_cmd . " " . s:name2 
	else 
		execute  "silent read ! ".g:pydoc_cmd. " -k " . s:name2 
	endif	
	setlocal nomodified
	set filetype=man
	normal 1G
 if !exists('g:pydoc_highlight')
		let g:pydoc_highlight = 1
	endif
  if g:pydoc_highlight ==1
		call Highlight(s:name2)
	endif	
endfunction


function! Highlight(name)
	exe "sb __doc__"
	set filetype=man
	syn on
	exe 'syntax keyword pydoc '.s:name2
	hi pydoc gui=reverse

endfunction




"mappings
map  <leader>pw :call ShowPyDoc('<C-R><C-W>', 1)<CR> 
map  <leader>pW :call ShowPyDoc('<C-R><C-A>', 1)<CR> 
"commands
command -nargs=1 Pydoc :call ShowPyDoc('<args>', 1)
command -nargs=*  PydocSearch :call ShowPyDoc('<args>', 0)
