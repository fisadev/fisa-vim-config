syntax on

" descomentar las siguientes lineas para resaltar las lineas de más de 80 columnas en los .py
" highlight OverLength ctermbg=red ctermfg=white guibg=#FF3333 guifg=#EEEEEE
" let matchOverLength = matchadd("OverLength", "\\%81v.*")

" resaltado de espacios al final de lineas
highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd("BadWhitespace", "\\s\\+$")

" resaltado de tabs al final de lineas
highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd("BadTabs", "^\\t+")
