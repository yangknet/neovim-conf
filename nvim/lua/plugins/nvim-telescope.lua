return { -- 返回插件配置表
    'nvim-telescope/telescope.nvim', version = '*', -- 插件仓库地址，使用任意版本
    dependencies = { -- 插件依赖
        'nvim-lua/plenary.nvim', -- plenary.nvim 是 telescope 的必需依赖（提供 Lua 工具函数）
        -- optional but recommended -- 可选但推荐
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- fzf 原生扩展，提供更快的模糊搜索（需要编译）
    },
    opts = function (_, opts) -- 插件选项配置函数
      local builtin = require('telescope.builtin') -- 加载 telescope 的内置功能
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- 映射 <Space>ff 到文件查找功能
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' }) -- 映射 <Space>fg 到实时 grep 搜索功能
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' }) -- 映射 <Space>fb 到缓冲区列表功能
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' }) -- 映射 <Space>fh 到帮助标签搜索功能
    end
}
