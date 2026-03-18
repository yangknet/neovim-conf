return { -- 返回插件配置表
  "startup-nvim/startup.nvim", -- 插件仓库地址（启动屏幕插件）
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" }, -- 插件依赖（telescope 及其文件浏览器）
  config = function () -- 插件配置函数
    require('startup').setup { -- 初始化 startup 插件
      -- every line should be same width without escaped \ -- 每行应该有相同的宽度（不包括转义的 \）
      header = { -- 头部配置
          type = "text", -- 类型（文本）
          oldfiles_directory = false, -- 不显示旧文件目录
          align = "center", -- 对齐方式（居中）
          fold_section = false, -- 不折叠该部分
          title = "Header", -- 标题
          margin = 5, -- 边距
          content = { -- 内容（ASCII 艺术字）
            " ",
            " ",
            "  ,-.       _,---._ __  / \\  ",
            " /  )    .-'       `./ /   \\ ",
            "(  (   ,'            `/    /|",
            " \\  `-\"             \\'\\   / |",
            "  `.              ,  \\ \\ /  |",
            "   /`.          ,'-`----Y   |",
            "  (            ;        |   '",
            "  |  ,-.    ,-'         |  / ",
            "  |  | (   |            | /  ",
            "  )  |  \\  `.___________|/   ",
            "  `--'   `--'                ",
          },
          highlight = "Statement", -- 高亮组
          default_color = "", -- 默认颜色
          oldfiles_amount = 0, -- 旧文件数量
      },
      -- name which will be displayed and command -- 显示的名称和命令
      body = { -- 主体配置
          type = "mapping", -- 类型（映射）
          oldfiles_directory = false, -- 不显示旧文件目录
          align = "center", -- 对齐方式（居中）
          fold_section = false, -- 不折叠该部分
          title = "Basic Commands", -- 标题
          margin = 5, -- 边距
          content = { -- 内容（命令映射）
              { " Find File", "Telescope find_files", "<leader>ff" }, -- 查找文件
              { "󰍉 Find Word", "Telescope live_grep", "<leader>lg" }, -- 查找单词
              { " Recent Files", "Telescope oldfiles", "<leader>of" }, -- 最近文件
              { " File Browser", "Telescope file_browser", "<leader>fb" }, -- 文件浏览器
              { " New File", "lua require'startup'.new_file()", "<leader>nf" }, -- 新建文件
          },
          highlight = "String", -- 高亮组
          default_color = "", -- 默认颜色
          oldfiles_amount = 0, -- 旧文件数量
      },
      footer = { -- 底部配置
          type = "text", -- 类型（文本）
          oldfiles_directory = false, -- 不显示旧文件目录
          align = "center", -- 对齐方式（居中）
          fold_section = false, -- 不折叠该部分
          title = "Footer", -- 标题
          margin = 5, -- 边距
          content = { "eltrac.nvim" }, -- 内容（项目名称）
          highlight = "Number", -- 高亮组
          default_color = "", -- 默认颜色
          oldfiles_amount = 0, -- 旧文件数量
      },

      options = { -- 选项配置
          mapping_keys = true, -- 启用映射键显示
          cursor_column = 0.5, -- 光标列位置（0.5 表示居中）
          empty_lines_between_mappings = true, -- 映射之间显示空行
          disable_statuslines = true, -- 禁用状态行
          paddings = { 1, 3, 3, 0 }, -- 内边距
      },
      mappings = { -- 映射配置
          execute_command = "<CR>", -- 执行命令（回车键）
          open_file = "o", -- 打开文件（o 键）
          open_file_split = "<c-o>", -- 在新窗口打开文件（Ctrl+o）
          open_section = "<TAB>", -- 打开部分（Tab 键）
          open_help = "?", -- 打开帮助（? 键）
      },
      colors = { -- 颜色配置
          background = "#1f2227", -- 背景颜色
          folded_section = "#56b6c2", -- 折叠部分颜色
      },
      parts = { "header", "body", "footer" }, -- 显示的部分（头部、主体、底部）
  }
  end
}
