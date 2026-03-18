-- < BASIC TWEAKS > ---

-- set leader key to space
vim.g.mapleader = " " -- 将 Leader 键设置为空格键，用于创建自定义快捷键前缀

-- disable built-in tree
vim.g.loaded_netrw = 1 -- 禁用 Neovim 内置的 netrw 文件浏览器，防止自动加载
vim.g.loaded_netrwPlugin = 1 -- 禁用 netrw 插件，以便使用第三方文件浏览器（如 oil.nvim）

-- enable true color support
vim.opt.termguicolors = true -- 启用终端真彩色支持（24位颜色），支持现代配色方案

-- enable line number
vim.o.number = true -- 在左侧显示绝对行号

-- show diagnostic
vim.diagnostic.config({ -- 配置 LSP（语言服务器协议）诊断信息的显示方式
  virtual_text = true, -- 在错误行末尾显示虚拟文本错误信息
  signs = true, -- 在行号列显示错误符号（如 E、W、I）
  underline = true, -- 在错误文本下方显示下划线
  update_in_insert = false, -- 插入模式下不更新诊断信息，避免干扰输入
})

-- remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", { -- 创建自动命令，在保存文件前触发
  pattern = "*", -- 对所有文件类型生效
  command = [[%s/\s\+$//e]], -- 删除所有行尾的空白字符（%:整个文件, \s\+$:行尾空白, //:删除, e:不报错）
})

-- ensure new line at eof
vim.opt.endofline = true -- 确保文件以换行符结尾（Unix 标准）
vim.opt.fixendofline = true -- 保存时自动添加缺失的文件末尾换行符

-- tab width
vim.opt.tabstop = 4 -- Tab 键显示为 4 个空格宽度
vim.opt.shiftwidth = 4 -- 自动缩进时使用 4 个空格
vim.opt.expandtab = true -- 将 Tab 键转换为空格，避免不同编辑器对 Tab 的解释不一致

-- hightlight current line
vim.cmd("set cursorline") -- 高亮显示光标所在的行，提高代码可读性

-- escape TERMNIAL mode using ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- 在终端模式下按 Esc 退出到普通模式（t:终端模式, <Esc>:触发键, <C-\\><C-n>:退出命令）

-- disable certain providers
vim.g.loaded_perl_provider = 0 -- 禁用 Perl 语言提供器，提高启动速度（如果不使用 Perl）
vim.g.loaded_ruby_provider = 0 -- 禁用 Ruby 语言提供器，提高启动速度（如果不使用 Ruby）

--- < PLUGINS > ---

require("filetype") -- 加载 lua/filetype.lua，配置文件类型检测（如 Go HTML 模板）
require("config.lazy") -- 加载 lua/config/lazy.lua，初始化 lazy.nvim 插件管理器并加载所有插件
