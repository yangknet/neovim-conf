return { -- 返回插件配置表
  'nvim-treesitter/nvim-treesitter', -- 插件仓库地址（语法高亮和解析器）
  lazy = false, -- 禁用延迟加载（启动时立即加载）
  build = ':TSUpdate', -- 安装后执行命令（更新解析器）
  config = function () -- 插件配置函数
    require("nvim-treesitter").setup() -- 初始化 nvim-treesitter 插件
    require("nvim-treesitter").install({ 'javascript', 'html', 'css', 'go' }) -- 安装指定语言的解析器
  end
}
