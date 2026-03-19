# Neovim 配置说明

## 总览

这是一个现代化、模块化且功能完善的 Neovim 配置方案，基于 **lazy.nvim** 插件管理器构建。配置遵循 "约定优于配置" 的原则，提供了开箱即用的开发体验，同时保持高度可定制性。

### 核心特点

- 🎯 **模块化架构**：配置按功能拆分为独立模块，易于维护和扩展
- 🚀 **快速启动**：使用 lazy.nvim 实现插件延迟加载，提升启动速度
- 🎨 **现代化 UI**：基于 TokyoNight 主题，配合 Bufferline 和 Lualine 提供美观的状态栏
- 🛠️ **完整开发工具链**：LSP + Treesitter + CMP 提供智能代码补全和代码分析
- 📝 **Markdown 增强**：专门配置了 Markdown 渲染和脚注管理工具
- 🎮 **高效操作**：丰富的快捷键映射，提升编辑效率

---

## 目录结构

```
nvim/
├── init.lua                    # 主配置文件，入口点
├── lazy-lock.json              # 插件版本锁定文件（自动生成）
└── lua/
    ├── core/                   # 核心配置模块
    │   ├── options.lua         # Neovim 基础选项设置
    │   ├── keymaps.lua         # 键位映射配置
    │   └── lazy.lua            # lazy.nvim 插件管理器初始化
    └── plugins/                # 插件配置目录
        ├── autopairs.lua       # 自动配对括号/引号
        ├── bufferline.lua      # 多标签页管理
        ├── cmp.lua             # 智能代码补全 (LuaSnip + LSP)
        ├── comment.lua         # 智能注释工具
        ├── footnote.lua        # Markdown 脚注管理
        ├── fzf.lua             # 文件搜索和查找工具
        ├── gitsigns.lua        # Git 变更指示器
        ├── im-select.lua       # 输入法自动切换
        ├── lazy-git.lua        # Git UI 工具
        ├── lsp.lua             # LSP 语言服务器配置
        ├── lualine.lua         # 状态栏定制
        ├── markdown-plus.lua   # Markdown 增强功能
        ├── multiple-cursors.lua # 多光标编辑
        ├── nvim-tree.lua       # 文件浏览器
        ├── oil.lua             # 高级文件浏览器
        ├── render-markdown.lua # Markdown 实时预览
        ├── tokyonight.lua      # 主题配置
        └── treesitter.lua      # 语法高亮和代码解析
```

---

## 核心模块详解

### 1. 主配置文件 (`init.lua`)

```lua
-- 设置 Leader 键
vim.g.mapleader = " "          -- 全局 Leader 键：空格
vim.g.maplocalleader = "\\"    -- 局部 Leader 键：反斜杠

-- 加载核心模块
require("core.options")         -- 基础选项
require("core.keymaps")         -- 键位映射
require("core.lazy")            -- 插件管理器
```

**设计思路**：
- Leader 键必须在其他配置之前设置，确保所有插件都能正确绑定快捷键
- 采用模块化加载方式，提高配置可读性和维护性

---

### 2. 核心选项 (`core/options.lua`)

#### 行号显示
- `relativenumber = true`：相对行号（方便移动光标）
- `number = true`：绝对行号（显示当前位置）

#### 代码缩进
- `tabstop = 2`：Tab 显示为 2 个空格
- `shiftwidth = 2`：自动缩进为 2 个空格
- `expandtab = true`：将 Tab 转换为空格
- `autoindent = true`：自动继承上一行缩进

#### 用户体验
- `wrap = false`：禁用自动换行，保持代码结构清晰
- `cursorline = true`：高亮当前行
- `splitright = true` / `splitbelow = true`：新窗口在右/下侧打开
- `ignorecase = true` / `smartcase = true`：智能大小写搜索
- `termguicolors = true`：启用 24-bit 真彩色
- `clipboard = "unnamedplus"`：使用系统剪贴板

---

### 3. 键位映射 (`core/keymaps.lua`)

#### 插入模式
- `jk` → `<ESC>`：快速退出插入模式

#### 视觉模式
- `J` / `K`：上下移动选中行（保持视觉选择状态）

#### 正常模式
- `<leader>2` / `<leader>3`：水平/垂直分割窗口
- `<leader>nh`：取消搜索高亮
- `<C-L>` / `<C-H>`：切换下一个/上一个 buffer
- `s` → `<nop>`：禁用 `s` 命令（防止误触）
- `S` → `:w<CR>`：保存文件
- `Q` → `:q<CR>`：关闭窗口
- `<Leader>qq` → `:xa!<CR>`：强制退出所有窗口
- `<leader>e`：切换 nvim-tree 文件浏览器

#### 插件快捷键
- `<leader>ff`：查找文件
- `<leader>fg`：全局搜索
- `<leader>fb`：查找 buffer
- `<leader>lg`：打开 LazyGit
- `<leader>fn` / `<leader>of`：Markdown 脚注操作

---

### 4. 插件管理 (`core/lazy.lua`)

**lazy.nvim 引导流程**：
1. 检查是否已安装 lazy.nvim
2. 未安装时自动从 GitHub 克隆（使用 `--filter=blob:none` 优化下载速度）
3. 将 lazy.nvim 添加到 runtimepath 优先加载
4. 加载 `lua/plugins/` 目录下所有插件配置

**配置特性**：
- 自动检查插件更新
- 支持插件延迟加载（按需加载，提升启动速度）
- 支持插件依赖管理

---

## 插件详解

### 核心开发工具

#### 📚 代码补全系统 (`plugins/cmp.lua`)

**组件**：
- **nvim-cmp**：补全引擎
- **cmp-nvim-lsp**：LSP 源
- **cmp-buffer**：当前 buffer 源
- **cmp-path**：文件路径补全
- **LuaSnip**：代码片段引擎
- **cmp_luasnip**： snippets 集成

**快捷键**：
- `<C-b>` / `<C-f>`：滚动补全文档
- `<C-e>`：取消补全
- `<CR>`：确认补全
- `<Tab>` / `<S-Tab>`：在补全项间切换
- `<Tab>` 在 snippet 中：展开或跳转到下一个占位符

**补全源优先级**：
1. LSP（语言服务器）
2. LuaSnip（代码片段）
3. Path（路径）
4. Buffer（当前缓冲区）

---

#### 🔧 LSP 语言服务器 (`plugins/lsp.lua`)

**组件**：
- **mason.nvim**：语言服务器安装管理器
- **mason-lspconfig**：Mason 和 LSP 配置桥接
- **nvim-lspconfig**：LSP 配置集合

**配置**：
- 自动安装 `lua_ls`（Lua 语言服务器）
- 启用 CMP 的 LSP 能力
- 支持 Neovim 0.11+ 的新 API

**扩展方法**：
```lua
-- 在 ensure_installed 中添加需要的语言服务器
ensure_installed = {
  "lua_ls",
  "pyright",    -- Python
  "ts_ls",      -- TypeScript
  "clangd",     -- C/C++
  -- ...
}
```

---

#### 🌲 Treesitter 语法高亮 (`plugins/treesitter.lua`)

**功能**：
- 语法高亮（基于 AST，比正则更准确）
- 语法缩进
- 括号彩虹颜色（rainbow）：不同层级括号显示不同颜色

**支持语言**：
vim, vimdoc, bash, c, cpp, javascript, json, lua, python, typescript, tsx, css, rust, markdown, markdown_inline

**扩展方法**：
```lua
-- 添加更多语言到 ensure_installed
ensure_installed = { "all" }  -- 或指定特定语言
```

---

### UI 增强

#### 🎨 主题 (`plugins/tokyonight.lua`)

- **主题**：TokyoNight（moon 风格）
- **特性**：
  - 语义化样式（注释斜体、关键字斜体）
  - 终端颜色支持
  - 保持背景不透明

#### 📊 状态栏 (`plugins/lualine.lua`)

- 使用 TokyoNight 主题配色
- 显示模式、文件名、位置、LSP 状态等信息

#### 🏷️ 标签页管理 (`plugins/bufferline.lua`)

- 显示缓冲区列表
- 集成 LSP 诊断信息
- 为 nvim-tree 留出空间

#### 🗂️ 文件浏览器

**nvim-tree**：
- 默认不开启
- 自动跟随当前文件
- 集成 nvim-web-devicons 图标

**oil.nvim**：
- 高级文件浏览器
- 可在 Neovim 中直接编辑文件和目录
- 使用 `-` 键打开父目录

---

### 开发效率工具

#### 🔍 搜索查找 (`plugins/fzf.lua`)

**功能**：
- `fzf-lua`：现代化的模糊查找工具
- 集成 nvim-web-devicons 图标

**快捷键**：
- `<leader>ff`：查找文件
- `<leader>fg`：全局搜索（grep）
- `<leader>fb`：查找缓冲区
- `<leader>fh`：帮助标签搜索

#### 📝 Markdown 增强

**markdown-plus.nvim**：
- Markdown 专用功能增强

**render-markdown.nvim**：
- 实时渲染 Markdown 预览
- 集成 Treesitter 语法高亮

**footnote.nvim**：
- 脚注管理
- 快捷键：
  - `<leader>fn`：新建脚注
  - `<leader>of`：整理脚注
  - `[f` / `]f`：跳转脚注

#### 🖊️ 多光标编辑 (`plugins/multiple-cursors.lua`)

**功能**：
- 类似 VSCode 的多光标编辑
- 支持鼠标、键盘多种操作方式

**快捷键**：
- `<C-j>` / `<C-k>`：添加光标并移动
- `<C-Up>` / `<C-Down>`：添加光标（插入模式可用）
- `<C-LeftMouse>`：添加/删除光标
- `<Leader>m`：在可视区域每行添加光标
- `<Leader>a`：全文匹配添加光标
- `<Leader>l`：锁定光标
- `<Leader>d` / `<Leader>D`：跳转到下一个匹配

**使用场景**：
1. 批量重命名：`<Leader>a` → 输入新名称
2. 多行注释：`<Leader>m` → 输入注释符号
3. 选择性编辑：`<Leader>d` → 逐个选择位置

#### 🔗 Git 集成

**gitsigns.nvim**：
- 在 gutter 显示 Git 变更
- `+`：新增行
- `~`：修改行
- `_` / `‾`：删除行

**lazygit.nvim**：
- 内置 Git UI 工具
- `<leader>lg`：打开 LazyGit 界面

#### 🎯 自动配对 (`plugins/autopairs.lua`)

- 自动配对括号 `()`, `[]`, `{}` 
- 引号 `''`, `""`, `` ` ``
- 在 InsertEnter 事件时加载

#### 💬 智能注释 (`plugins/comment.lua`)

- `gc`：切换注释
- `gcc`：注释当前行
- `gbc`：注释块

#### 🖥️ 输入法切换 (`plugins/im-select.lua`)

- Mac 系统自动切换输入法
- 需要安装 `macism`：`brew install macism`

---

## 安装指南

### 前置要求

1. **Neovim 0.9+**（推荐 0.10+）
   ```bash
   # Mac
   brew install neovim
   
   # Ubuntu/Debian
   sudo apt install neovim
   ```

2. **Git**（用于克隆插件）
   ```bash
   # Mac
   brew install git
   
   # Ubuntu/Debian
   sudo apt install git
   ```

3. **可选工具**：
   ```bash
   # Mac 输入法切换
   brew install macism
   
   # LazyGit
   brew install lazygit
   ```

### 安装步骤

1. **备份现有配置**（如果存在）：
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **克隆配置**：
   ```bash
   git clone <your-config-repo> ~/.config/nvim
   ```

3. **首次启动**：
   ```bash
   nvim
   ```
   - lazy.nvim 会自动安装
   - 插件会自动安装（首次启动可能需要等待）

4. **安装语言服务器**（自动）：
   - 插件会自动通过 Mason 安装 `lua_ls`
   - 可手动安装其他语言服务器

---

## 常用操作

### 文件操作
- `<leader>e`：打开/关闭 nvim-tree
- `-`：打开 oil 文件浏览器
- `<C-L>` / `<C-H>`：切换下一个/上一个标签页
- `S`：保存文件

### 搜索查找
- `<leader>ff`：查找文件
- `<leader>fg`：全局搜索
- `<leader>fb`：查找缓冲区
- `/`：普通搜索（`<leader>nh` 取消高亮）

### 代码编辑
- `<Tab>`：补全/展开 snippet
- `<C-j>` / `<C-k>`：多光标添加
- `<Leader>a`：全文匹配添加光标
- `<Leader>l`：锁定光标
- `gc`：注释/取消注释

### Git 操作
- `<leader>lg`：打开 LazyGit
- gutter 中的符号显示 Git 变更

### Markdown 编辑
- `<leader>fn`：新建脚注
- `<leader>of`：整理脚注
- `[f` / `]f`：跳转脚注

---

## 配置定制

### 添加新插件

在 `lua/plugins/` 目录下创建新文件，例如 `my-plugin.lua`：

```lua
return {
  "author/my-plugin.nvim",
  dependencies = {
    "author/dependency.nvim"
  },
  config = function()
    require("my-plugin").setup({
      -- 配置选项
    })
  end
}
```

### 修改主题

编辑 `lua/plugins/tokyonight.lua`：
```lua
style = "storm"  -- 或 "night", "day"
transparent = true  -- 透明背景
```

### 调整快捷键

编辑 `lua/core/keymaps.lua`：
```lua
keymap.set("n", "<leader>new", ":MyCommand<CR>")
```

---

## 故障排除

### 插件安装失败
```bash
# 清理 lazy.nvim 缓存
rm -rf ~/.local/share/nvim/lazy
# 重新启动 Neovim
nvim
```

### LSP 不工作
```bash
# 检查 Mason 安装
:Mason
# 手动安装语言服务器
```

### 启动缓慢
- 检查插件是否过度延迟加载
- 使用 `:Lazy` 查看插件状态
- 考虑移除不常用的插件

---

## 技术栈总结

| 类别 | 技术 | 说明 |
|------|------|------|
| **插件管理** | lazy.nvim | 延迟加载，快速启动 |
| **主题** | TokyoNight | 现代化配色方案 |
| **补全** | nvim-cmp + LuaSnip | 智能补全和代码片段 |
| **LSP** | Mason + nvim-lspconfig | 语言服务器管理 |
| **语法高亮** | Treesitter | 基于 AST 的语法解析 |
| **UI** | Bufferline + Lualine | 标签页和状态栏 |
| **搜索** | fzf-lua | 模糊查找工具 |
| **Git** | gitsigns + lazygit | Git 集成和 UI |
| **文件浏览** | nvim-tree + oil | 双文件浏览器方案 |

---

## 总结

这份 Neovim 配置是一个**生产就绪**的现代编辑器环境，具备以下优势：

✅ **开箱即用**：配置完整，无需额外设置即可使用  
✅ **模块化设计**：每个功能独立配置，易于维护和扩展  
✅ **性能优化**：延迟加载机制确保快速启动  
✅ **开发体验**：LSP + Treesitter + CMP 提供智能编码辅助  
✅ **Git 集成**：完整的 Git 工具链支持  
✅ **Markdown 支持**：专门优化的 Markdown 编辑体验  

配置遵循 Neovim 最佳实践，适合中高级用户使用，同时也为初学者提供了友好的默认配置。通过修改 `lua/plugins/` 目录下的配置文件，您可以轻松定制属于自己的开发环境。

---

**配置版本**：1.0  
**Neovim 要求**：0.9+ (推荐 0.10+)  
**最后更新**：2026-03-19
