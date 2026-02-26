" ==================================================
" VIM 10-FINGER ERGONOMIC SETUP (Ubuntu)
" ==================================================
set laststatus=2
set statusline=%F 
set nocompatible        " enable full Vim features
set number              " show absolute line numbers
set relativenumber      " show relative line numbers
set ruler               " show cursor position
"set cursorline          " highlight current line
set showcmd             " display partial commands
set showmode            " show current mode
set hlsearch            " highlight search matches
set ignorecase          " case-insensitive search
set smartcase           " smart case-sensitive search
set incsearch           " incremental search
set scrolloff=3         " keep 3 lines above/below cursor
set sidescrolloff=5     " keep 5 columns left/right
set timeoutlen=250      " mapping delay for jk/jj escape

inoremap  jk <Esc>

let mapleader = " "     " leader key set to Space

nnoremap <leader>w :w<CR>          " save file
nnoremap <leader>q :q<CR>          " quit
nnoremap <leader>x :x<CR>          " save and quit
nnoremap <leader>t :tabnew<CR>     " open new tab
nnoremap <leader>h :nohlsearch<CR> " clear search highlight

nnoremap <leader>h <C-w>h          " window left
nnoremap <leader>j <C-w>j          " window down
nnoremap <leader>k <C-w>k          " window up
nnoremap <leader>l <C-w>l          " window right
