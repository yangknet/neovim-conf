return { -- 返回插件配置表
    'MeanderingProgrammer/render-markdown.nvim', -- 插件仓库地址（Markdown 渲染增强插件）
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons -- 依赖项（treesitter 语法解析器和图标库）
    opts = {}, -- 插件选项（使用默认配置）
}
