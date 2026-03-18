return {
  "fatih/vim-go",
  ft = { "go", "gohtmltmpl", "gotexttmpl", "gomod", "gowork" },
  build = ":GoUpdateBinaries",
  config = function()
    -- vim-go configuration
    vim.g.go_fmt_command = "goimports"
    vim.g.go_metalinter_enabled = { 'vet', 'golint', 'errcheck' }
    vim.g.go_metalinter_autosave = 1
    vim.g.go_doc_keywordprg_enabled = 0
    vim.g.go_def_mapping_enabled = 0
    vim.g.go_code_completion_enabled = 0
    
    -- Enable syntax highlighting for Go templates
    vim.g.go_template_syntax = 1
    vim.g.go_template_use_html = 1
    
    -- Key mappings
    vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<cr>', { desc = 'Go Run' })
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<cr>', { desc = 'Go Build' })
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<cr>', { desc = 'Go Test' })
  end,
}