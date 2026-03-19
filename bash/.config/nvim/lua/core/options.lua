-- ==================================================
-- OPTIONS
-- ==================================================
local opt = vim.opt

opt.compatible    = false        -- enable full Neovim features
opt.number        = true         -- absolute line numbers
opt.relativenumber= true         -- relative line numbers
opt.ruler         = true         -- show cursor position
opt.cursorline = true            -- highlight current line (uncomment to enable)
opt.showcmd       = true         -- display partial commands
opt.showmode      = true         -- show current mode
opt.hlsearch      = true         -- highlight search matches
opt.ignorecase    = true         -- case-insensitive search
opt.smartcase     = true         -- smart case-sensitive search
opt.incsearch     = true         -- incremental search
opt.scrolloff     = 3            -- keep 3 lines above/below cursor
opt.sidescrolloff = 5            -- keep 5 columns left/right
opt.timeoutlen    = 250          -- mapping delay (jk escape)
opt.laststatus    = 2            -- always show statusline
opt.statusline    = "%F"         -- show full file path in statusline
opt.tabstop	  = 2		 -- tabstop
opt.shiftwidth 	  = 2
opt.expandtab	  = true
opt.softtabstop = 2 
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", space = "·", eol = "↵" }
opt.clipboard = "unnamedplus"
