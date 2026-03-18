return { -- 返回插件配置表
    'tamton-aquib/duck.nvim', -- 插件仓库地址（在编辑器中显示小鸭子动画）
    config = function() -- 插件配置函数
      local symbol = "🐈" -- 设置鸭子符号（使用猫咪表情）
      local speed = 3 -- 设置鸭子移动速度

      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch(symbol, speed) end, {}) -- Leader+dd 孵化鸭子
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {}) -- Leader+dk 煮鸭子（移除一只）
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {}) -- Leader+da 煮所有鸭子（移除全部）
    end
}
