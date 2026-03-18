local M = {}

-- Detect Go HTML template files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.html", "*.tmpl", "*.gohtml"},
    callback = function(args)
        -- Only detect if vim-go is not loaded (it handles this better)
        if not vim.g.go_loaded then
            -- Check if file contains Go template syntax
            local content = vim.fn.readfile(args.file, "", 50) -- Read first 50 lines
            local has_template = false
            
            for _, line in ipairs(content) do
                if line:match("{{.<>}}") or line:match("{{.*}}") then
                    has_template = true
                    break
                end
            end
            
            if has_template then
                vim.bo[args.buf].filetype = "gohtmltmpl"
            end
        end
    end,
})

return M