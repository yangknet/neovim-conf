> [!NOTE]  
> This repository was permanently moved to [src.eltr.ac/eltrac/nvim](https://src.eltr.ac/eltrac/nvim/), my own Forgejo instance.

![screenshot](screenshot.png)

# `eltrac.nvim`

Come and observe a clumsy koala tweaks his editor. (He's really new at this)

---

## 📖 配置文件介绍

这是一个精心配置的 Neovim 配置，使用了现代化的插件管理系统。

### 📁 配置结构

主配置文件 [`init.lua`](init.lua) 分为两个主要部分：

---

### ⚙️ 基本设置（BASIC TWEAKS）

#### 1. 键位映射
- **Leader 键**：设置为空格键（第 5 行）
- **终端模式退出**：在终端模式下按 `Esc` 可以退出（第 40 行）

#### 2. 视觉增强
- **真彩色支持**：启用终端真彩色（第 11 行）
- **行号显示**：启用行号（第 14 行）
- **当前行高亮**：高亮显示光标所在行（第 37 行）

#### 3. 诊断配置
配置了 LSP 诊断显示方式（第 17-22 行）：
- 虚拟文本显示错误
- 显示符号标记
- 下划线标记
- 插入模式不更新诊断

#### 4. 代码清理
- **删除行尾空格**：保存文件时自动删除（第 25-28 行）
- **文件末尾换行**：确保文件以换行符结尾（第 31-32 行）

#### 5. 缩进设置
- Tab 宽度：4 个空格（第 35 行）
- Shift 宽度：4 个空格
- 使用空格代替 Tab

#### 6. 性能优化
- 禁用内置的 netrw 文件浏览器（第 8-9 行）
- 禁用 Perl 和 Ruby provider（第 43-44 行）

---

### 🔌 插件系统（PLUGINS）

#### 插件管理器
使用 **lazy.nvim** 作为插件管理器（[`lua/config/lazy.lua`](lua/config/lazy.lua)）：
- 自动安装和更新插件
- 支持从 `lua/plugins/` 目录导入插件配置
- 自动检查插件更新

---

## 📦 插件列表

| 插件名称 | 功能描述 |
|---------|---------|
| **kanagawa** | Kanagawa 配色方案 |
| **nvim-telescope** | 强大的模糊查找器 |
| **nvim-lspconfig** | LSP（语言服务器协议）配置 |
| **nvim-cmp** | 自动补全系统 |
| **nvim-treesitter** | 高级语法高亮和解析 |
| **mason** | LSP 服务器管理工具 |
| **nvim-autopairs** | 自动括号配对 |
| **lazygit** | Git 集成界面 |
| **oil.nvim** | 现代化文件浏览器 |
| **heirline** | 可定制的状态栏 |
| **render-markdown** | Markdown 文件渲染增强 |
| **markdown-plus** | Markdown 编辑增强功能 |
| **vim-go** | Go 语言开发支持 |
| **clojure** | Clojure 语言支持 |
| **jieba** | 中文分词支持 |
| **flash-zh** | 中文快速跳转 |
| **im-select** | 智能输入法切换 |
| **duck** | 可爱的小鸭子动画 |
| **encrypt** | 文件加密功能 |
| **footnote** | 脚注管理 |
| **opencode** | 快速打开代码 |
| **startup** | 美观的启动画面 |
| **ts-autotag** | HTML/XML 标签自动闭合 |
| **nvim-toggler** | 布尔值快速切换 |
| **wakatime** | 编程时间统计 |

---

## 🎯 特色功能

### 文件类型检测
[`lua/filetype.lua`](lua/filetype.lua) 提供了 Go HTML 模板文件的自动检测功能，能够识别 `*.html`、`*.tmpl`、`*.gohtml` 文件中的 Go 模板语法。

---

## 💡 配置亮点

1. **现代化架构**：使用 Lua 配置，性能更好
2. **模块化设计**：插件配置分离到独立文件，易于维护
3. **自动化清理**：自动删除行尾空格，保持代码整洁
4. **多语言支持**：包含 Go、Clojure、Markdown 等多种语言支持
5. **中文优化**：包含中文分词、输入法切换等中文用户友好功能
6. **美观界面**：Kanagawa 配色方案、状态栏、启动画面等
7. **高效开发**：集成 LSP、自动补全、Git 等开发工具

---

## 🚀 快速开始

1. 备份现有的 Neovim 配置
2. 克隆此配置到 `~/.config/nvim`
3. 启动 Neovim，lazy.nvim 会自动安装所有插件

---

## 📝 配置文件说明

- **[`init.lua`](init.lua)** - 主配置文件
- **[`lua/config/lazy.lua`](lua/config/lazy.lua)** - 插件管理器配置
- **[`lua/filetype.lua`](lua/filetype.lua)** - 文件类型检测
- **[`lua/plugins/`](lua/plugins/)** - 各个插件的独立配置文件

---

这是一个功能丰富、配置完善的 Neovim 环境，适合日常开发使用！
