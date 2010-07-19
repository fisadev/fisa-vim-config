" FILE:     plugin/conque_term.vim {{{
" AUTHOR:   Nico Raffo <nicoraffo@gmail.com>
" MODIFIED: 2010-02-02
" VERSION:  1.0, for Vim 7.0
" LICENSE:
" Conque - pty interaction in Vim
" Copyright (C) 2009-2010 Nico Raffo 
"
" MIT License
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
" }}}

" See docs/conque_term.txt for help or type :help conque_term

if exists('g:ConqueTerm_Loaded') || v:version < 700
    finish
endif

" **********************************************************************************************************
" **** CONFIG **********************************************************************************************
" **********************************************************************************************************

" Enable color {{{
if !exists('g:ConqueTerm_Color')
    let g:ConqueTerm_Color = 1
endif " }}}

" TERM environment setting {{{
if !exists('g:ConqueTerm_TERM')
    let g:ConqueTerm_TERM =  'vt100'
endif " }}}

" Syntax for your buffer {{{
if !exists('g:ConqueTerm_Syntax')
    let g:ConqueTerm_Syntax = 'conque_term'
endif " }}}

" Read when unfocused {{{
if !exists('g:ConqueTerm_ReadUnfocused')
    let g:ConqueTerm_ReadUnfocused = 1
endif " }}}

" Use this regular expression to highlight prompt {{{
if !exists('g:ConqueTerm_PromptRegex')
    let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
endif " }}}

" **********************************************************************************************************
" **** Startup *********************************************************************************************
" **********************************************************************************************************

" Startup {{{
setlocal encoding=utf-8

let g:ConqueTerm_Loaded = 1
let g:ConqueTerm_Idx = 1

command! -nargs=+ -complete=shellcmd ConqueTerm call conque_term#open(<q-args>)
command! -nargs=+ -complete=shellcmd ConqueTermSplit call conque_term#open(<q-args>, ['split'])
command! -nargs=+ -complete=shellcmd ConqueTermVSplit call conque_term#open(<q-args>, ['vsplit'])

" }}}

