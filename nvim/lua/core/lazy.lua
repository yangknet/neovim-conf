-- Bootstrap lazy.nvim -- 引导加载 lazy.nvim 插件管理器
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- 定义 lazy.nvim 的安装路径（在 Neovim 数据目录下）
if not (vim.uv or vim.loop).fs_stat(lazypath) then -- 检查 lazy.nvim 是否已安装（使用 uv 或 loop API 检查文件是否存在）
  local lazyrepo = "https://github.com/folke/lazy.nvim.git" -- 定义 lazy.nvim 的 GitHub 仓库地址
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }) -- 如果未安装，则克隆仓库（使用 blob:none 过滤器只下载必要文件，使用 stable 分支）
  if vim.v.shell_error ~= 0 then -- 检查 git 命令是否执行成功
    vim.api.nvim_echo({ -- 如果失败，显示错误信息
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, -- 错误消息标题
      { out, "WarningMsg" }, -- git 命令的输出
      { "\nPress any key to exit..." }, -- 提示用户按键退出
    }, true, {}) -- 显示错误信息并等待用户输入
    vim.fn.getchar() -- 等待用户按键
    os.exit(1) -- 退出程序（返回错误码 1）
  end
end
vim.opt.rtp:prepend(lazypath) -- 将 lazy.nvim 路径添加到 runtimepath 的最前面，确保优先加载

-- Setup lazy.nvim -- 设置 lazy.nvim
require("lazy").setup({ -- 调用 lazy.nvim 的 setup 函数进行配置
  spec = { -- 插件规范配置
    -- import your plugins -- 导入你的插件
    { import = "plugins" }, -- 从 lua/plugins/ 目录导入所有插件配置文件
  },
  -- Configure any other settings here. See the documentation for more details. -- 在这里配置其他设置，详见文档
  -- colorscheme that will be used when installing plugins. -- 安装插件时使用的配色方案
  -- install = { colorscheme = { "habamax" } }, -- 设置安装插件时使用的默认配色方案为 habamax
  -- automatically check for plugin updates -- 自动检查插件更新
  checker = { enabled = true }, -- 启用自动检查插件更新功能
})
