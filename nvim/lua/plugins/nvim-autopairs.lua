return { -- 返回插件配置表
    'windwp/nvim-autopairs', -- 插件仓库地址（自动配对括号、引号等）
    event = "InsertEnter", -- 在进入插入模式时加载（延迟加载）
    config = true -- 使用默认配置（相当于调用 setup({}) 函数）
    -- use opts = {} for passing setup options -- 使用 opts = {} 传递配置选项
    -- this is equivalent to setup({}) function -- 这相当于调用 setup({}) 函数
}
