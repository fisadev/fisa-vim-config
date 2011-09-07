" DBGp client: a remote debugger interface to the DBGp protocol
"
" Script Info and Documentation  {{{
"=============================================================================
"    Copyright: Copyright (C) 2010 Jared Forsyth
"      License:	The MIT License

" Do not source this script when python is not compiled in.
if !has("python")
    finish
endif

python << EOF
import vim
try:
    from vim_debug.commands import debugger_cmd
    vim.command('let has_debug = 1')
except ImportError, e:
    vim.command('let has_debug = 0')
    print 'python module vim_debug not found...'
EOF

if !has_debug
    finish
endif

command! -nargs=* Dbg python debugger_cmd('<args>')

" Debugger highlighting
hi DbgCurrent term=reverse ctermfg=White ctermbg=Red gui=reverse
hi DbgBreakPt term=reverse ctermfg=White ctermbg=Green gui=reverse
sign define current text=->  texthl=DbgCurrent linehl=DbgCurrent
sign define breakpt text=B>  texthl=DbgBreakPt linehl=DbgBreakPt
