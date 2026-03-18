return { -- 返回插件配置表
  {
    "neovim/nvim-lspconfig", -- 插件仓库地址（Neovim LSP 配置插件）
    dependencies = { -- 插件依赖
      "hrsh7th/nvim-cmp", -- 自动补全插件
      "hrsh7th/cmp-nvim-lsp", -- LSP 补全源
      "mason-org/mason.nvim", -- LSP 服务器管理工具
      "mason-org/mason-lspconfig.nvim", -- Mason 和 LSPconfig 的桥梁
    },
    config = function() -- 插件配置函数
      local lsps = { "gopls", "marksman", "ts_ls", "vue_ls", "cssls", "html", 'unocss'  } -- 定义要安装的 LSP 服务器列表（Go、Markdown、TypeScript、Vue、CSS、HTML、UnoCSS）

	    -- ensure installs with Mason -- 使用 Mason 确保安装 LSP 服务器
      require("mason-lspconfig").setup({ ensure_installed = lsps }) -- 配置 Mason 自动安装指定的 LSP 服务器

      -- configure LUA lsp -- 配置 Lua 语言服务器
	    vim.lsp.config('lua_ls', { -- 配置 lua_ls（Lua 语言服务器）
        settings = { -- 服务器设置
          Lua = { -- Lua 特定设置
            diagnostics = { -- 诊断设置
              globals = {'vim'} -- 将 'vim' 定义为全局变量，避免警告
            }
          }
        }
      })
      -- / configure LUA lsp -- 结束 Lua 语言服务器配置

      -- configure VUE language server -- 配置 Vue 语言服务器
      local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server' -- 定义 Vue 语言服务器的路径
      local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'} -- 定义 TypeScript 服务器支持的文件类型
      local vue_plugin = { -- 定义 Vue 插件配置
        name = '@vue/typescript-plugin', -- 插件名称
        location = vue_language_server_path, -- 插件位置
        languages = { 'vue' }, -- 支持的语言
        configNamespace = 'typescript', -- 配置命名空间
      }

      local ts_ls_config = { -- TypeScript 服务器配置
        init_options = { -- 初始化选项
          plugins = { -- 插件列表
            vue_plugin, -- 添加 Vue 插件
          },
        },
        filetypes = tsserver_filetypes, -- 支持的文件类型
      }

      local vue_ls_config = {} -- Vue 服务器配置（空配置，使用默认设置）

      vim.lsp.config('vue_ls', vue_ls_config) -- 配置 Vue 语言服务器
      vim.lsp.config('ts_ls', ts_ls_config) -- 配置 TypeScript 语言服务器
      -- / configure VUE language server -- 结束 Vue 语言服务器配置

      vim.lsp.enable(lsps) -- 启用所有配置的 LSP 服务器
    end,
  },
}
