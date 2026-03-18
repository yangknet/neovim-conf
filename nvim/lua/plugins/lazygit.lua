return { -- 返回插件配置表
    "kdheepak/lazygit.nvim", -- 插件仓库地址（LazyGit 的 Neovim 集成）
    lazy = true, -- 启用延迟加载
    cmd = { -- 命令触发加载（当执行这些命令时才加载插件）
        "LazyGit", -- 打开 LazyGit 界面
        "LazyGitConfig", -- 打开 LazyGit 配置
        "LazyGitCurrentFile", -- 对当前文件打开 LazyGit
        "LazyGitFilter", -- 打开 LazyGit 过滤器
        "LazyGitFilterCurrentFile", -- 对当前文件打开 LazyGit 过滤器
    },
    -- optional for floating window border decoration -- 可选依赖（用于浮动窗口边框装饰）
    dependencies = { -- 插件依赖
        "nvim-lua/plenary.nvim", -- Neovim 的通用库
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in -- 推荐使用 'keys' 设置 LazyGit 的键位绑定
    -- order to load the plugin when the command is run for the first time -- 这样可以在第一次运行命令时加载插件
    keys = { -- 键位映射
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } -- Leader+lg 打开 LazyGit
    }
}
