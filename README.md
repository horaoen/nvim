# 🚀 AI 增强的 Neovim 配置

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的个人 Neovim 配置，集成了 AI 编程助手和现代化的开发工具。

## ✨ 特性

### 🤖 AI 编程助手

- **OpenCode** - 强大的 AI 编程助手，支持代码生成、解释和优化
- **Avante** - 智能代码补全和建议
- **快捷键集成** - `<C-a>` 询问 AI，`<C-x>` 执行 AI 操作

### 📝 Markdown 增强

- **render-markdown.nvim** - 实时 Markdown 预览和渲染
- **语法高亮** - 增强的 Markdown 语法支持
- **Avante 支持** - 在 AI 对话中渲染 Markdown

### 🔧 开发工具

- **LazyVim 核心** - 现代化的 Neovim 配置框架
- **Blink.cmp** - 快速的代码补全引擎
- **多语言支持** - Docker、Go、JSON、Markdown 等语言扩展

### ⚡ 性能优化

- **延迟加载** - 插件按需加载，启动速度快
- **内存优化** - 禁用不必要的内置插件
- **自动更新检查** - 定期检查插件更新

## 📦 安装

### 前置条件

- Neovim >= 0.9.0
- Git
- [可选] Nerd Font 用于图标显示

### 安装步骤

1. **备份现有配置**

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

1. **克隆此配置**

```bash
git clone <repository-url> ~/.config/nvim
```

1. **启动 Neovim**

```bash
nvim
```

1. **等待插件安装**

Lazy.nvim 会自动安装所有插件，首次启动可能需要几分钟。

### 验证安装

- 检查 `:Lazy` 确认所有插件已安装
- 尝试 `<C-a>` 快捷键测试 AI 助手
- 打开 Markdown 文件测试渲染功能

## ⚙️ 配置说明

### 配置文件结构

```text
~/.config/nvim/
├── init.lua              # 入口文件
├── lua/
│   ├── config/           # 核心配置
│   │   ├── lazy.lua      # Lazy.nvim 配置
│   │   ├── options.lua   # 基本选项
│   │   ├── keymaps.lua   # 键位映射
│   │   └── autocmds.lua  # 自动命令
│   └── plugins/          # 插件配置
│       ├── agent.lua     # AI 助手插件
│       ├── cmp.lua       # 补全插件
│       └── markdown.lua  # Markdown 插件
├── lazyvim.json          # LazyVim 额外配置
└── stylua.toml           # Lua 格式化配置
```

### 自定义插件

在 `lua/plugins/` 目录下创建新的 `.lua` 文件来添加插件：

```lua
return {
  "username/plugin-name",
  opts = {
    -- 插件选项
  },
}
```

### 修改选项

编辑 `lua/config/options.lua` 来自定义 Neovim 选项。

### 键位映射

在 `lua/config/keymaps.lua` 中添加自定义键位映射。

## ⌨️ 快捷键

### AI 助手 (OpenCode)

- `<C-a>` - 询问 AI 关于当前代码
- `<C-x>` - 执行 AI 操作菜单
- `ga` - 添加内容到 OpenCode
- `<C-.>` (终端模式) - 切换 OpenCode
- `<S-C-u>` - OpenCode 向上翻页
- `<S-C-d>` - OpenCode 向下翻页

### LazyVim 核心快捷键

- `<leader>l` - Lazy 菜单
- `<leader>f` - 文件操作
- `<leader>g` - Git 操作
- `<leader>w` - 窗口管理

### Markdown

- `<leader>md` - 切换 Markdown 渲染
- `<leader>mp` - 预览 Markdown

## 🔧 故障排除

### 插件安装失败

```bash
# 清理并重新安装
rm -rf ~/.local/share/nvim/lazy
nvim +':Lazy restore'
```

### AI 助手无法工作

1. 检查网络连接
2. 确认 API 密钥配置
3. 重启 Neovim

### Markdown 渲染问题

1. 确认文件类型为 `markdown`
2. 检查 `render-markdown.nvim` 插件状态
3. 尝试 `:RenderMarkdown` 命令

### 性能问题

1. 检查 `:Lazy profile` 查看插件性能
2. 禁用不需要的插件
3. 调整 `lazy.lua` 中的性能设置

### 获取帮助

- 查看 [LazyVim 文档](https://lazyvim.github.io/)
- 检查插件官方文档
- 使用 `:help` 命令查看内置帮助

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置。

### 开发环境设置

1. Fork 此仓库
2. 创建功能分支
3. 提交更改
4. 创建 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

- [LazyVim](https://github.com/LazyVim/LazyVim) - 优秀的 Neovim 配置框架
- [OpenCode](https://github.com/NickvanDyke/opencode.nvim) - 强大的 AI 编程助手
- [Blink.cmp](https://github.com/saghen/blink.cmp) - 快速的补全引擎
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- Markdown 渲染插件
- 所有贡献者和插件作者

