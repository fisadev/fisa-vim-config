syntax on

" highlight "bad stuff" on python code 

" long lines (80+)
" highlight OverLength ctermbg=red ctermfg=white guibg=#FF3333 guifg=#EEEEEE
" let matchOverLength = matchadd("OverLength", "\\%81v.*")

" trailing spaces
highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd("BadWhitespace", "\\s\\+$")

" lines starting with tabs
highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd("BadTabs", "^\\t+")
