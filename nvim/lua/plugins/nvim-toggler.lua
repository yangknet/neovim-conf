return { -- 返回插件配置表
  'nguyenvukhang/nvim-toggler', -- 插件仓库地址（快速切换单词的工具，如 true/false）
  opts = function (_, opts) -- 插件选项配置函数
    require('nvim-toggler').setup() -- 初始化 nvim-toggler 插件
  end
}
