vim.g.mapleader = " "           -- set Space as leader key (must be before any mappings)

local map = vim.keymap.set      -- shortcut so we don't repeat vim.keymap.set every line
local opts = { noremap = true }
-- exit insert mode by typing jk quickly instead of reaching for Esc
map("i", "jk", "<Esc>")

-- file operations
map("n", "<leader>w", ":w<CR>")          -- save file
map("n", "<leader>q", ":q<CR>")          -- quit
map("n", "<leader>x", ":x<CR>")          -- save and quit

-- tabs
map("n", "<leader>t", ":tabnew<CR>")     -- open a new tab

-- search
map("n", "<leader>nh", ":nohlsearch<CR>") -- clear search highlights (renamed from h to avoid conflict)

-- window navigation (move between splits)
map("n", "<leader>h", "<C-w>h")          -- focus split to the left
map("n", "<leader>j", "<C-w>j")          -- focus split below
map("n", "<leader>k", "<C-w>k")          -- focus split above
map("n", "<leader>l", "<C-w>l")          -- focus split to the right

-- insert mode 
map("i", "<C-a>", "<C-o>^") 		 -- enter C-o -> move to start -> enter i
map("i", "<C-e>", "<C-o>$") 		 -- enter C-o -> move to end -> enter i

-- normal mode
map("n", "<C-a>", '^')			 -- additional for ^
map("n", "<C-e>", '$')			 -- additional for $

-- visual mode
map("v", "<C-a>", "^")			 -- additional for ^
map("v", "<C-e>", "$") 			 -- additional for $
map("v", "jk", "<Esc>" ) 		 -- jk to 'Esc' 

