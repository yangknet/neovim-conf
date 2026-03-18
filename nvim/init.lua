-- < BASIC TWEAKS > ---

-- set leader key to space
vim.g.mapleader = " "

-- disable built-in tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable true color support
vim.opt.termguicolors = true

-- enable line number
vim.o.number = true

-- show diagnostic
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- ensure new line at eof
vim.opt.endofline = true
vim.opt.fixendofline = true

-- tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- hightlight current line
vim.cmd("set cursorline")

-- escape TERMNIAL mode using ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- disable certain providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

--- < PLUGINS > ---

require("filetype")
require("config.lazy")
