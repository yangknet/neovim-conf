return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",                -- load on Insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",              -- LSP completions
      "hrsh7th/cmp-buffer",                -- buffer words
      "hrsh7th/cmp-path",                  -- path completions
      "L3MON4D3/LuaSnip",                  -- snippet engine
      "saadparwaiz1/cmp_luasnip",          -- LuaSnip source
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load() -- load snippets

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]     = cmp.mapping.confirm({ select = true }),
        ["<C-n>"]    = cmp.mapping.select_next_item(),
        ["<C-p>"]    = cmp.mapping.select_prev_item(),
      })

      opts.sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }
    end,
  },
}
