return { -- mac系统需要安装macism命令
    "keaising/im-select.nvim",
    config = function()
        require("im_select").setup({
          default_command = "macism"
        })
    end,
}
