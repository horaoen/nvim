# Neovim Configuration with AI Enhancements

## Project Overview

This project is a personal Neovim configuration built on top of the **LazyVim** framework. It is heavily customized to integrate AI programming assistants and provide a modern development experience.

**Key Features:**

* **AI Integration:** Includes **OpenCode** and **Avante** for AI-assisted coding, code generation, and explanation.
* **Markdown Focus:** Enhanced Markdown editing with **render-markdown.nvim** for real-time preview and rendering.
* **Language Support:** Pre-configured support for Docker, Go, JSON, and Lua via LazyVim extras.
* **UI/UX:** Modern UI with **Blink.cmp** for completion, animations (`mini.animate`), and other visual enhancements.

## Building and Running

Since this is a configuration for Neovim, "running" refers to launching Neovim with this config.

### Installation

1. **Backup:** Ensure existing Neovim configs are backed up (`~/.config/nvim`, `~/.local/share/nvim`).
2. **Clone:** Clone this repository to `~/.config/nvim`.
3. **Launch:** Run `nvim`. Lazy.nvim will automatically bootstrap and install all plugins.

### Key Keymaps

* **LazyVim Standard:**
  * `<leader>l`: Lazy plugin manager.
  * `<leader>f`: File operations.
  * `<leader>g`: Git operations.
* **Markdown:**
  * `<leader>md`: Toggle Markdown rendering.
  * `<leader>mp`: Markdown preview.

## Development Conventions

* **Framework:** **LazyVim**. Configuration follows the standard LazyVim directory structure.
* **Language:** **Lua**.
* **Plugin Management:** **Lazy.nvim**.
  * Core config: `lua/config/` (options, keymaps, autocmds).
  * Plugins: `lua/plugins/` (returns Lua tables with plugin specs).
* **Formatting:** `stylua.toml` is present, indicating **StyLua** is used for formatting Lua files.
* **Documentation:** The primary `README.md` and documentation are written in **Chinese**.
