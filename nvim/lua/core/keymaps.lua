local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>2", "<C-w>s") -- 水平新增窗口 
keymap.set("n", "<leader>3", "<C-w>v") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

keymap.set("n", "s", ":<nop>")
keymap.set("n", "S", ":w<CR>")
keymap.set("n", "Q", ":q<CR>")
keymap.set("n", "<Leader>qq", ":xa!<CR>")
-- 后退（上一个文件）：Ctrl + O
-- 前进（下一个文件）：Ctrl + I
-- :new 文件名  " 横向分窗新建文件（如 :new demo.md）
-- :vnew 文件名 " 纵向分窗新建文件
-- :edit 文件名 " 不拆分窗口，直接新建/打开文件（最常用）

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
