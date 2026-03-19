return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- 默认不开启nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- 自动跟随打开文件
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
      },
    })
  end
}
