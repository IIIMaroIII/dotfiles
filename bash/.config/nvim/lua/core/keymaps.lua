-- ==================================================
-- KEYMAPS
-- ==================================================
vim.g.mapleader = " "  -- Space as leader key

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- --------------------------------------------------
-- INSERT MODE
-- --------------------------------------------------
map({"i", "v"}, "jk", "<Esc>", opts)                          -- escape insert mode

-- --------------------------------------------------
-- LEADER: FILE OPERATIONS
-- --------------------------------------------------
map("n", "<leader>w", ":w<CR>",  opts)                 -- save
map("n", "<leader>q", ":q<CR>",  opts)                 -- quit
map("n", "<leader>x", ":x<CR>",  opts)                 -- save and quit
map("n", "<leader><leader>", ":", opts)

-- --------------------------------------------------
-- LEADER: TABS
-- --------------------------------------------------
map("n", "<leader>t", ":tabnew<CR>", opts)             -- new tab
map("n", "<leader>|", ":vsplit ", opts)
map("n", "<leadear>e", ":e ", opts)
map("n", "<leader><leader>", ":", opts)

-- --------------------------------------------------
-- Normal Mode
-- --------------------------------------------------
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)


-- --------------------------------------------------
-- LEADER: SEARCH
-- --------------------------------------------------
map("n", "<leader>n", ":nohlsearch<CR>", opts)         -- clear search highlight

-- --------------------------------------------------
-- LEADER: WINDOW NAVIGATION
-- --------------------------------------------------
map("n", "<leader>h", "<C-w>h", opts)                  -- window left
map("n", "<leader>j", "<C-w>j", opts)                  -- window down
map("n", "<leader>k", "<C-w>k", opts)                  -- window up
map("n", "<leader>l", "<C-w>l", opts)                  -- window right

-- --------------------------------------------------
-- LINE MOTION: Ctrl+a = ^ (first non-blank)
--              Ctrl+e = $ (end of line)
-- Works in normal, visual, AND operator-pending (d, c, y, etc.)
-- Examples: d<C-e> deletes to end of line, c<C-a> changes to first char
-- --------------------------------------------------
map({ "n", "v", "o" }, "<C-a>", "^", opts)             -- start of line (non-blank)
map({ "n", "v", "o" }, "<C-e>", "$", opts)             -- end of line
