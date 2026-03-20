return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    vim.keymap.set("n", "\\f", builtin.find_files, { desc = "Find files cwd" })
    vim.keymap.set("n", "\\F", function()
      builtin.find_files({ cwd = "~", hidden = true })
    end, { desc = "Find files home" })
    vim.keymap.set("n", "\\g", builtin.live_grep,  { desc = "Grep cwd" })
    vim.keymap.set("n", "\\G", function()
      builtin.live_grep({ cwd = "~" })
    end, { desc = "Grep home" })
    vim.keymap.set("n", "\\b", builtin.buffers,    { desc = "Buffers" })
    vim.keymap.set("n", "\\r", builtin.oldfiles,   { desc = "Recent files" })
    vim.keymap.set("n", "\\h", builtin.help_tags,  { desc = "Help tags" })
  end,
}
