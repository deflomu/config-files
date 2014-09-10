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
set tabstop=4
set shiftwidth=4
" Use spaces instead of tab
set expandtab

filetype plugin indent on

" Show cursor position
set ruler

" Use utf-8
set encoding=utf-8

" Set fancy powerline
let g:Powerline_symbols = 'fancy'

" Always show location view if a syntax error is detected
" let g:syntastic_auto_loc_list = 1
" Jump to first syntax error on save or open
let g:syntastic_auto_jump = 2

" Always display powerline
set laststatus=2

" Change special chars for :set list
set listchars=eol:↵,tab:▸\ ,trail:~,extends:>,precedes:<

" Set and create vim temp/undo/backup file dir
silent execute '!mkdir -p ~/.vim/temp'
silent execute '!mkdir -p ~/.vim/backup'
silent execute '!mkdir -p ~/.vim/undo'
set directory=~/.vim/temp//
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

" Do not backup temp crontab files. Wihtout this 'crontab -e' will not work.
set backupskip=/tmp/crontab*,/private/tmp/crontab*

set modelines=0
if exists('+relativenumber')
	set relativenumber
endif
if exists('+undofile')
	set undofile
endif
set wildmenu
set wildmode=list:longest
set ttyfast
set cursorline
set backspace=indent,eol,start
set hlsearch
set incsearch
set showmatch

" Set key for custom commands
let mapleader = ","

" Press ,<space> to clear search
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
" Show rule in column 81
if exists('+colorcolumn')
	set colorcolumn=81
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Use ,w to open new split view an switch to it
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set mouse=a

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/syntastic'

