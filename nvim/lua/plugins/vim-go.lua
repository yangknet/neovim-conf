return { -- 返回插件配置表
  "fatih/vim-go", -- 插件仓库地址（Go 语言开发插件）
  ft = { "go", "gohtmltmpl", "gotexttmpl", "gomod", "gowork" }, -- 指定文件类型触发加载（延迟加载）
  build = ":GoUpdateBinaries", -- 安装后执行命令（更新 Go 二进制工具）
  config = function() -- 插件配置函数
    -- vim-go configuration -- vim-go 配置
    vim.g.go_fmt_command = "goimports" -- 设置代码格式化工具为 goimports
    vim.g.go_metalinter_enabled = { 'vet', 'golint', 'errcheck' } -- 启用的 linter 列表（代码检查工具）
    vim.g.go_metalinter_autosave = 1 -- 自动保存时运行 linter（1 表示启用）
    vim.g.go_doc_keywordprg_enabled = 0 -- 禁用文档关键词查找（0 表示禁用）
    vim.g.go_def_mapping_enabled = 0 -- 禁用定义跳转映射（0 表示禁用）
    vim.g.go_code_completion_enabled = 0 -- 禁用代码补全（0 表示禁用）
    
    -- Enable syntax highlighting for Go templates -- 启用 Go 模板语法高亮
    vim.g.go_template_syntax = 1 -- 启用模板语法高亮
    vim.g.go_template_use_html = 1 -- 使用 HTML 语法高亮
    
    -- Key mappings -- 键位映射
    vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<cr>', { desc = 'Go Run' }) -- Leader+gr 运行 Go 程序
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<cr>', { desc = 'Go Build' }) -- Leader+gb 构建 Go 程序
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<cr>', { desc = 'Go Test' }) -- Leader+gt 运行 Go 测试
  end,
}