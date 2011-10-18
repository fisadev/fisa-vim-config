" Maintainer:	Kevin Hamer <kevin@imarc.net>
" Version:      1.1
" Last Change:	Tue Aug  9 14:39:46 EDT 2011

"" Based off the colors for Ambiance, the 2011 Ubuntu dark human theme.
"" Derived from Mustang by Henrique C. Alves (hcarvalhoalves@gmail.com)
"" Offers 256 color support.

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ambient"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#3c3c3c ctermbg=237
  hi CursorColumn guibg=#3c3c3c ctermbg=237
  hi MatchParen guifg=#e69c0d ctermfg=178 guibg=#3c3c3c ctermbg=237 gui=bold cterm=bold
  hi Pmenu 		guifg=#ffffff ctermfg=15 guibg=#4c4c4c ctermbg=239
  hi PmenuSel 	guifg=#000000 ctermfg=0 guibg=#f07746 ctermbg=209
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#4c4c4c ctermbg=239 gui=none
hi Normal 		guifg=#f2f1f0 ctermfg=7 guibg=#202020 ctermbg=234 gui=none
hi NonText 		guifg=#3c3c3c ctermfg=237 gui=none
hi LineNr 		guifg=#4c4c4c ctermfg=239 gui=none
hi StatusLine 	guifg=#d3d3d5 ctermfg=188 guibg=#3c3c3c ctermbg=237
hi StatusLineNC guifg=#939395 ctermfg=246 guibg=#3c3c3c ctermbg=237 gui=none
hi VertSplit 	guifg=#202020 ctermfg=234 guibg=#3c3c3c ctermbg=237 gui=none
hi Folded 		guifg=#0999e0 ctermfg=32 guibg=#3c3c3c ctermbg=237 gui=none
hi Title		guifg=#f2f1f0 ctermfg=7 guibg=NONE	gui=bold cterm=bold
hi Visual		guifg=#ffffff ctermfg=15 guibg=#4c4c4c ctermbg=239 gui=none
hi SpecialKey	guifg=#4c4c4c ctermfg=239 gui=none

" Syntax highlighting
hi Comment 		guifg=#7c7c7c ctermfg=8
hi Boolean      guifg=#94d9a8 ctermfg=115 gui=none
hi String 		guifg=#f07746 ctermfg=209
hi Identifier 	guifg=#d9c634 ctermfg=185 gui=none
hi Function 	guifg=#ffffff ctermfg=15 gui=bold cterm=bold
hi Type 		guifg=#e69c0d ctermfg=178 gui=none
hi Statement 	guifg=#f2f1f0 ctermfg=7 gui=bold cterm=bold
hi Keyword		guifg=#d9c634 ctermfg=185 gui=none
hi Constant 	guifg=#d9c634 ctermfg=185 gui=none
hi Number		guifg=#94d9a8 ctermfg=115 gui=none
hi Special		guifg=#d9c634 ctermfg=185 gui=none
hi PreProc 		guifg=#faf4c6 ctermfg=230 gui=none
hi Todo         guifg=#202020 ctermfg=234 guibg=#d9c634 ctermbg=185

" Code-specific colors
hi pythonOperator guifg=#f07746 ctermfg=209 gui=none
