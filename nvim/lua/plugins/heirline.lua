return { -- 返回插件配置表
    "rebelot/heirline.nvim", -- 插件仓库地址（状态栏和标签栏插件）
    config = function() -- 插件配置函数
        require("heirline").setup({}) -- 初始化 heirline 插件（使用默认配置）
    end
}
