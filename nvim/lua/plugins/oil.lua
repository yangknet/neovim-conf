return { -- 返回插件配置表
  'stevearc/oil.nvim', -- 插件仓库地址（文件浏览器插件）
  ---@module 'oil' -- 类型注解（oil 模块）
  ---@type oil.SetupOpts -- 类型注解（oil 配置选项）
  opts = {}, -- 插件选项（使用默认配置）
  -- Optional dependencies -- 可选依赖
  dependencies = { { "nvim-mini/mini.icons", opts = {} } }, -- 使用 mini.icons 提供图标支持
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons -- 如果更喜欢 nvim-web-devicons，可以使用这个
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations. -- 不建议延迟加载，因为在所有情况下正确工作很困难
  lazy = false, -- 禁用延迟加载（启动时立即加载）
  config = function () -- 插件配置函数
    require("oil").setup() -- 初始化 oil 插件
  end
}
