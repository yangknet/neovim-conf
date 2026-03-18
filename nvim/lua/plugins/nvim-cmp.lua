return { -- 返回插件配置表
  {
    "hrsh7th/nvim-cmp", -- 插件仓库地址（Neovim 自动补全插件）
    event = "InsertEnter", -- 在进入插入模式时加载（延迟加载）
    dependencies = { -- 插件依赖
      "hrsh7th/cmp-nvim-lsp", -- LSP 补全源（提供来自 LSP 的补全）
      "hrsh7th/cmp-buffer", -- 缓冲区补全源（提供当前缓冲区的单词补全）
      "hrsh7th/cmp-path", -- 路径补全源（提供文件路径补全）
      "L3MON4D3/LuaSnip", -- 代码片段引擎（用于管理代码片段）
      "saadparwaiz1/cmp_luasnip", -- LuaSnip 补全源（将 LuaSnip 集成到 nvim-cmp）
    },
    opts = function(_, opts) -- 插件选项配置函数
      local cmp = require("cmp") -- 加载 nvim-cmp 插件
      local luasnip = require("luasnip") -- 加载 LuaSnip 插件

      require("luasnip.loaders.from_vscode").lazy_load() -- 从 VSCode 格式加载代码片段

      opts.snippet = { -- 配置代码片段
        expand = function(args) -- 展开代码片段的函数
          luasnip.lsp_expand(args.body) -- 使用 LuaSnip 展开代码片段
        end,
      }

      opts.mapping = cmp.mapping.preset.insert({ -- 配置补全映射（使用预设的插入模式映射）
        ["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space 触发补全
        ["<CR>"]     = cmp.mapping.confirm({ select = true }), -- Enter 确认选择（如果已选择）
        ["<C-n>"]    = cmp.mapping.select_next_item(), -- Ctrl+n 选择下一个补全项
        ["<C-p>"]    = cmp.mapping.select_prev_item(), -- Ctrl+p 选择上一个补全项
      })

      opts.sources = { -- 配置补全源及其顺序
        { name = "nvim_lsp" }, -- LSP 补全源（优先级最高）
        { name = "luasnip" }, -- 代码片段补全源
        { name = "buffer" }, -- 缓冲区补全源
        { name = "path" }, -- 路径补全源
      }
    end,
  },
}
