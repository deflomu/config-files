" Highlight sytax
syntax on
" Show line numbers
set number
" Use desert colorscheme
colorscheme desert

" Highlight whitespaces at end of lines, and mixed tabs/spaces
highlight MixedWhitespaces ctermbg=red guibg=red
match MixedWhitespaces /\(\t\+ \+\| \+\t\+\| \s\+$\)/

" Automatically indent when using bracket
set smartindent
" Use indent of previous line if creating a new line
set autoindent
" Show tab as two spaces
set tabstop=2
set shiftwidth=2

" Show cursor position
set ruler

" Use utf-8
set encoding=utf-8

" Enable pathogen
call pathogen#infect()

" Set fancy powerline
let g:Powerline_symbols = 'fancy'

" Always display powerline
set laststatus=2
