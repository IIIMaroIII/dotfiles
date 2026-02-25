inoremap jk <Esc>
set relativenumber
let mapleader=" "
set timeoutlen=250

nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Jump to next / previous match in line
nnoremap ; f
nnoremap , F

nnoremap <leader>w :w<CR>         " save
nnoremap <leader>q :q<CR>         " quit
nnoremap <leader>x :x<CR>         " save + quit

" Use H / M / L to jump within window
nnoremap H ^            " top of screen
nnoremap M M            " middle of screen
nnoremap L $            " bottom of screen
