# QnDots

Minimal, personal dotfiles powered by:

- `zsh` shell
- `neovim` text editor
- `kitty` terminal
- `tmux` + `tpm`
- `fzf` and `bat`
- `starship` prompt *(optional — not currently installed; zsh default prompt is used)*

---

## ⚙️ Setup

```bash
# From the repo root
stow .
```

This symlinks `~/.config/{zsh,nvim,kitty,tmux}` and `~/.zshenv`.

### First-time extras

1. **tmux plugins**: start tmux and press `Ctrl + Space` then `I` to install the plugins.
2. **nvim Mason tools**: open nvim and run:
   ```vim
   :MasonInstall stylua prettier eslint_d
   ```
   LSP servers (`lua_ls`, `ts_ls`) are installed automatically by `mason-lspconfig.nvim`.

---

## 🔧 Dependencies

- `stow`
- `zsh`
- `neovim` 0.12+
- `kitty`
- `tmux` 3.x + `tpm`
- `fzf`
- `bat`
- `git`
- `node` / `npm` (for Mason-managed `prettier` and `eslint_d`)
- A **Nerd Font** (e.g. `FiraCode Nerd Font`) — needed for file-type icons in nvim. Without it, icons render as empty/broken glyphs while using `Fira Code`.

---

## 🎨 Style

- Theme: `tokyonight`

---

## ⌨️ Notable keybindings

| Context | Key | Action |
|---|---|---|
| tmux | `Ctrl + Space` | Prefix |
| tmux | `prefix + h/j/k/l` | Switch pane |
| nvim | `Alt + h/j/k/l` | Switch vim split / tmux pane |
| nvim | `Alt + 1..0` | Jump to buffer (barbar) |
| nvim | `Leader k` | LSP group |
| nvim | `Leader n / N` | Reveal / toggle neo-tree |
| nvim | `Leader f f` / `f g` | Telescope find files / live grep |
| nvim | `Leader g` | LazyGit |
| nvim | `Leader t` | Toggle floating terminal |
| nvim | `Leader h` | Git hunk group |
| nvim | `F5` / `F10` / `F11` / `F12` | DAP continue / step |

`Leader` is `<Space>`.

---

## ✅ Verification

```bash
zsh -i -c true
kitty --config .config/kitty/kitty.conf --listen-on none &
tmux -L test -f .config/tmux/tmux.conf new-session -d
nvim --headless +qa
```
