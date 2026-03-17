return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "lua", "bash", "markdown", "markdown_inline" },
      highlight = { enable = true },
    })
  end,
}
