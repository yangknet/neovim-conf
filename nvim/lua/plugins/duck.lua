return {
    'tamton-aquib/duck.nvim',
    config = function()
      local symbol = "🐈"
      local speed = 3

      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch(symbol, speed) end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
    end
}
