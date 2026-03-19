return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup({
      -- 确保安装，根据需要填写
      ensure_installed = {
        "lua_ls",
      },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- 使用新的 vim.lsp.config API (Neovim 0.11+)
    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
    })
    vim.lsp.enable('lua_ls')
  end
}
