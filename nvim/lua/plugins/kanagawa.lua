return { -- 返回插件配置表
  "rebelot/kanagawa.nvim", -- 插件仓库地址（Kanagawa 配色方案）
  lazy = false, -- 立即加载，不延迟加载（因为这是配色方案，需要立即应用）
  priority = 1000, -- 设置高优先级，确保在其他插件之前加载
  config = function() -- 插件配置函数
    require("kanagawa").setup { -- 调用 kanagawa 的 setup 函数进行配置
      compile = true, -- 启用编译，提高加载速度
      theme = "dragon", -- 使用 dragon 主题（Kanagawa 的暗色主题）
    }
    vim.cmd([[colorscheme kanagawa-dragon]]) -- 应用 kanagawa-dragon 配色方案
  end,
}
