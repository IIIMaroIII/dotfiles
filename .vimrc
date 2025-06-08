
" -------------------------------------
" Appearance
" -------------------------------------
set background=dark
syntax on
set number
set showmatch

" -------------------------------------
" Search
" -------------------------------------
set hlsearch
set incsearch

" Disable compatibility with vi which can cause unexpected issueskjk.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on
filetype plugin indent on


autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.conf set filetype=conf
autocmd BufRead,BufNewFile *.log set filetype=log


" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4
		   
" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

" Gruvbox color scheme plugin
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
call plug#end()
colorscheme gruvbox

" }}}


" MAPPINGS --------------------------------------------------------------- {{{
let mapleader = '\'  
"map_mode <what_you_type> <what_is_executed>
"inoremap – Allows you to map keys in insert mode.
"vnoremap – Allomap keys in visual mode.

nnoremap <leader>\ :nohlsearch<CR>
inoremap jj <esc>
inoremap <C-e> <Esc>ea
inoremap <C-d> <Esc>dei
inoremap 2<Tab> <Tab><Tab> 
inoremap 3<Tab> <Tab><Tab><Tab>
inoremap 4<Tab> <Tab><Tab><Tab><Tab>
inoremap <C-b> <Esc>bi
inoremap <C-d> <Esc> dwi
inoremap <C-u> <Esc>d$a 
inoremap <C-k> <Esc>d^i

" Symbols
inoremap <leader>hc ✅ 
inoremap <leader>cm ✘
inoremap <leader>ca 📅 
inoremap <leader>rda ➡️  
inoremap <leader>ra →
inoremap <leader>bs ■
inoremap <leader>bc ●
inoremap <leader>bd ◆
inoremap <leader>st ★
inoremap <leader>rd ♦️
inoremap <leader>ro 🚀
inoremap <leader>cl 🍀 Note: 
inoremap <leader>bo 📚 Definition →→→  
inoremap <leader>lo 🔒
inoremap <leader>ke 🔑
inoremap <leader>tb 💭 Example:  
inoremap <leader>er ❌
inoremap <leader>ex ⚠️  
inoremap <leader>ext 📦 
inoremap <leader>bu 🛠
inoremap <leader>se ⚙️ 
inoremap <leader>in 📥 
inoremap <leader>sr 🔍 
inoremap <leader>cn 🥳 
inoremap <leader>wa ⛔
inoremap <leader>fo 📁
inoremap <leader>to 🧮
" Colourful numbers
inoremap <leader>0 ■ 0)
inoremap <leader>1 ■ 1)
inoremap <leader>2 ■ 2)
inoremap <leader>3 ■ 3)
inoremap <leader>4 ■ 4)
inoremap <leader>5 ■ 5)
inoremap <leader>6 ■ 6)
inoremap <leader>7 ■ 7)
inoremap <leader>8 ■ 8)
inoremap <leader>9 ■ 9) 

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
