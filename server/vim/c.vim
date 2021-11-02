" C VIM Config

" Tabs, customizing tab length to 8
set tabstop=8 shiftwidth=8

" Indentation
set autoindent

" Display numbers
set number 

" Show trailing white spaces
set hlsearch
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
