-- 必须在加载任何其他配置之前设置leader键
vim.g.mapleader = " " -- 设置全局 Leader 键为空格
vim.g.maplocalleader = "\\" -- 设置局部 Leader 键为反斜杠

require("core.options")
require("core.keymaps")
require("core.lazy")