return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      -- 启用自动保存
      enabled = true,
      auto_save = true,
      
      -- 延迟时间（毫秒）
      debounce_delay = 1000,
      
      -- 触发自动保存的事件
      trigger_events = {
        "BufLeave",      -- 离开缓冲区
        "FocusLost",     -- 窗口失去焦点
        "InsertLeave"    -- 退出插入模式
      },
      
      -- 其他设置
      do_not_save_in_insert_mode = false,
      silent_immediate_save = false,
      
      -- 可以跳过自动保存的文件类型
      filetypes_whitelist = {
        "dirvish",
        "fzf",
        "help",
        "lazy",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "Trouble",
        "tsplayground",
        "neotest-output",
      },
      
      -- 可以强制自动保存的文件类型
      filetypes_blacklist = {
        "gitcommit",
        "gitrebase",
        "gitsigns",
        "help",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "Trouble",
        "tsplayground",
        "neotest-output",
        "terminal",
        "lazygit",
        "lazy",
      },
    })
  end
}
