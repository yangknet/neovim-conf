return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup {
      compile = true,
      theme = "dragon",
    }
    vim.cmd([[colorscheme kanagawa-dragon]])
  end,
}
