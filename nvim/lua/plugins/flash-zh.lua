return {{ -- 返回插件配置表（包含两个插件的配置）
    "rainzm/flash-zh.nvim", -- 插件仓库地址（支持中文的快速跳转插件）
    event = "VeryLazy", -- 延迟加载（在启动后加载）
    dependencies = "folke/flash.nvim", -- 插件依赖（依赖 flash.nvim）
    keys = {{ -- 键位映射
        "s", -- 触发键（s 键）
        mode = {"n", "x", "o"}, -- 模式（普通模式、可视模式、操作符等待模式）
        function() -- 触发函数
            require("flash-zh").jump({ -- 调用 flash-zh 的跳转功能
                chinese_only = false -- 不仅限于中文（也支持英文）
            })
        end,
        desc = "Flash between Chinese" -- 描述（在中文之间跳转）
    }}
}, {
    "folke/flash.nvim", -- 插件仓库地址（快速跳转插件）
    event = "VeryLazy", -- 延迟加载（在启动后加载）
    opts = { -- 插件选项
        highlight = { -- 高亮配置
            backdrop = false, -- 禁用背景高亮
            matches = false -- 禁用匹配高亮
        }
    }
}}
