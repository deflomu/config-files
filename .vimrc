syntax on
set number
colorscheme desert

" Highlight whitespaces at end of lines, and mixed tabs/spaces
highlight MixedWhitespaces ctermbg=red guibg=red
match MixedWhitespaces /\(\t\+ \+\| \+\t\+\| \s\+$\)/

set cindent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2

