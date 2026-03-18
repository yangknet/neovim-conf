return { -- 返回插件配置表
    "keaising/im-select.nvim", -- 插件仓库地址（输入法自动切换插件）
    config = function() -- 插件配置函数
        require("im_select").setup({ -- 初始化 im-select 插件
          default_command = "macism" -- 默认输入法切换命令（macOS 的 macism 工具）
        })
    end,
}
