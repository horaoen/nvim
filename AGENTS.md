# Repository Guide for Agents

This repository is a personal Neovim config based on LazyVim. Most code is Lua.

## Repo Layout

- `init.lua`: entrypoint; bootstraps lazy.nvim via `require("config.lazy")`
- `lua/config/*.lua`: LazyVim extension points
  - `lua/config/lazy.lua`: lazy.nvim bootstrap + `require("lazy").setup(...)`
  - `lua/config/options.lua`, `lua/config/keymaps.lua`, `lua/config/autocmds.lua`: overrides (currently minimal)
- `lua/plugins/*.lua`: custom plugin specs/overrides (LazyVim style)
- `lazy-lock.json`: generated lockfile for plugins (avoid hand-editing)
- `stylua.toml`: Lua formatter config
- `.neoconf.json`: editor/LSP config (neodev enabled)

## Where Changes Go

- New/override plugin configs: add/edit files under `lua/plugins/`.
  - Prefer one concern per file (topic-based), following existing naming.
- Core config overrides:
  - Options: `lua/config/options.lua`
  - Keymaps: `lua/config/keymaps.lua`
  - Autocmds: `lua/config/autocmds.lua`
- Bootstrap / Lazy setup lives in `lua/config/lazy.lua` and is intentionally minimal.

## Commands (Build / Lint / Test)

There is no dedicated build/test harness in this repo (no `Makefile`, `package.json`, CI workflows, or `tests/`).

### Format (Lua)

- Format entire repo:
  - `stylua .`
- Format a single file:
  - `stylua lua/plugins/ui.lua`

Formatter config is in `stylua.toml`:
- `indent_type = "Spaces"`
- `indent_width = 2`
- `column_width = 120`

### Lint

- No repo-local Lua linter config found (no `selene.toml`, `.luacheckrc`).
- If you introduce linting, prefer adding an explicit config file and wiring a command section here.

### Smoke Check (Headless Neovim)

Use these to verify the config loads without UI:

- Minimal load:
  - `nvim --headless "+qa"`
- Load and surface errors (useful in CI/local scripts):
  - `nvim --headless "+lua vim.cmd('messages')" +qa`

If plugin state matters, Lazy can be driven headlessly (may install/update plugins):
- `nvim --headless "+Lazy! sync" +qa`

### Tests

- No test suite found in this repo.

If you add tests, use a standard Neovim/Lua approach and document it here. A common pattern is Plenary+Busted:

1) Create a minimal test init, e.g. `tests/minimal_init.lua`.
2) Add specs under `tests/` (e.g. `tests/foo_spec.lua`).
3) Run all tests headlessly:
   - `nvim --headless -u tests/minimal_init.lua \
       "+lua require('plenary.test_harness').test_directory('tests', { minimal_init = 'tests/minimal_init.lua' })" \
       +qa`
4) Run a single file:
   - same command but target a single file/directory.

Note: this repo currently depends on `nvim-lua/plenary.nvim` indirectly via plugins (see `lua/plugins/agent.lua`, `lua/plugins/git.lua`).

## Code Style Guidelines

Follow existing patterns in this repo (LazyVim + lazy.nvim plugin spec conventions). Keep changes small and local.

### Formatting

- Run `stylua` on edited Lua files (2-space indent, 120 columns).
- Prefer trailing commas in multi-line tables to minimize diff noise.

### Imports / Requires

- Use `require("...")` with double quotes.
- If a module is used more than once, bind it:
  - `local dashboard = require("alpha.themes.dashboard")`
- For Neovim version compatibility, prefer the existing pattern:
  - `(vim.uv or vim.loop)`

### Types / Annotations (Lua)

- When types help readability, prefer EmmyLua-style annotations:
  - `---@type string[]`
  - `---@param bufnr number`
- Don’t add annotations just to satisfy a tool; use them to clarify non-obvious shapes.

### Keymaps

- Prefer putting custom mappings in `lua/config/keymaps.lua`.
- Use `desc = "..."` on mappings so which-key/UIs can surface them.
- Prefer `<cmd>...<cr>` strings for Ex-commands (consistent with existing plugin specs).

### Autocmds

- Prefer `vim.api.nvim_create_autocmd` in `lua/config/autocmds.lua`.
- Avoid global side effects at module load time when an autocmd would be clearer.

### Plugin Specs (`lua/plugins/*.lua`)

- Each file returns either:
  - a single plugin spec table, or
  - a list of plugin spec tables

Common keys used here:
- `opts = { ... }` for plugin options
- `config = function() ... end` for imperative setup
- `dependencies = { ... }` for plugin deps
- `ft`, `cmd`, `keys` for lazy-loading triggers
- `optional = true` when extending an optional LazyVim plugin

Keep plugin specs declarative when possible; avoid complex logic in specs.

### Naming

- File names under `lua/plugins/` are short and topic-based (e.g. `git.lua`, `ui.lua`).
- Use readable local names; this repo uses simple lower-case names (`lazypath`, `lazyrepo`, `section_mru`).
- Don’t rename public plugin keys/options (they follow upstream plugin schemas).

### Error Handling

- Don’t silently swallow errors.
- Prefer explicit checks and user-facing messages when bootstrapping or invoking external commands.
  - Example pattern (see `lua/config/lazy.lua`): check `vim.v.shell_error`, show `vim.api.nvim_echo(...)`, then `os.exit(1)`.

### Compatibility / Minimum Version

- Assume Neovim v0.8+ (see note in `lua/plugins/git.lua`).
- When using APIs that changed across versions, guard them (example: `vim.uv` vs `vim.loop`).

### Change Hygiene

- Avoid drive-by refactors; keep diffs small and purpose-driven.
- Don’t edit `lazy-lock.json` unless you intentionally updated plugins.
- Prefer reusing existing dependencies/plugins over adding new ones.

### Generated / Lock Files

- Treat `lazy-lock.json` as generated; only change it when intentionally updating plugins.

## Cursor / Copilot Rules

- No Cursor rules found (`.cursor/rules/` or `.cursorrules`).
- No Copilot rules found (`.github/copilot-instructions.md`).

## Safe Changes Checklist

- Keep edits scoped to one plugin/config concern.
- Run `stylua` on touched Lua files.
- Run a headless Neovim smoke check: `nvim --headless "+qa"`.
