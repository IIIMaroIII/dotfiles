inoremap jk <Esc>
set relativenumber
let mapleader=" "
set timeoutlen=250

" inoremap
inoremap <C-h> <Home>
inoremap <C-l> <End>

" vnoremap
vnoremap H ^
vnoremap L $

nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap H ^
nnoremap L $

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

lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "neoclide/coc.nvim", branch = "release" },
})
EOF
