return { -- 返回插件配置表
  "NickvanDyke/opencode.nvim", -- 插件仓库地址（AI 辅助编程插件）
  dependencies = { -- 插件依赖
    -- Recommended for `ask()` and `select()`. -- 推荐用于 ask() 和 select() 功能
    -- Required for `snacks` provider. -- snacks 提供器所必需
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense. -- 加载 snacks.nvim 类型以提供配置智能提示
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } }, -- snacks.nvim 插件（提供输入、选择器和终端功能）
  },
  config = function() -- 插件配置函数
    ---@type opencode.Opts -- 类型注解（opencode 配置选项）
    vim.g.opencode_opts = { -- opencode 全局配置
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition". -- 你的配置（如果有）——参见 lua/opencode/config.lua 或"转到定义"
    }

    -- Required for `opts.events.reload`. -- opts.events.reload 所必需
    vim.o.autoread = true -- 启用自动读取文件（当文件在外部被修改时）

    -- Recommended/example keymaps. -- 推荐的/示例键位映射
    vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" }) -- Ctrl+a 询问 opencode
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" }) -- Ctrl+x 执行 opencode 操作
    vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" }) -- Ctrl+. 切换 opencode

    vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" }) -- go 将选区添加到 opencode
    vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" }) -- goo 将当前行添加到 opencode

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" }) -- Shift+Ctrl+u opencode 半页向上
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" }) -- Shift+Ctrl+d opencode 半页向下

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o". -- 如果你坚持使用上面的 "<C-a>" 和 "<C-x>"，你可能需要这些——否则考虑 "<leader>o"
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true }) -- + 键递增（映射到 Ctrl+a）
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true }) -- - 键递减（映射到 Ctrl+x）
  end,
}
