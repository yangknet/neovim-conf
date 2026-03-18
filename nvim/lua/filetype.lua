local M = {} -- 定义一个局部表 M，用于存储模块功能

-- Detect Go HTML template files -- 检测 Go HTML 模板文件
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { -- 创建自动命令，在读取或新建文件时触发
    pattern = {"*.html", "*.tmpl", "*.gohtml"}, -- 匹配 .html、.tmpl、.gohtml 扩展名的文件
    callback = function(args) -- 定义回调函数，args 包含事件参数
        -- Only detect if vim-go is not loaded (it handles this better) -- 只有在 vim-go 未加载时才检测（vim-go 处理得更好）
        if not vim.g.go_loaded then -- 检查 vim-go 是否已加载
            -- Check if file contains Go template syntax -- 检查文件是否包含 Go 模板语法
            local content = vim.fn.readfile(args.file, "", 50) -- 读取文件的前 50 行内容
            local has_template = false -- 初始化模板标志为 false
            
            for _, line in ipairs(content) do -- 遍历每一行内容
                if line:match("{{.<>}}") or line:match("{{.*}}") then -- 检查是否包含 Go 模板语法（{{...}}）
                    has_template = true -- 如果找到模板语法，设置标志为 true
                    break -- 跳出循环
                end
            end
            
            if has_template then -- 如果检测到模板语法
                vim.bo[args.buf].filetype = "gohtmltmpl" -- 将文件类型设置为 gohtmltmpl（Go HTML 模板）
            end
        end
    end,
})

return M -- 返回模块表 M