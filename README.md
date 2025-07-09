# Neovim Configuration

This repository contains a modular Neovim configuration designed for portability and easy setup across different machines. The configuration uses [vim-plug](https://github.com/junegunn/vim-plug) as its plugin manager and is organized in a way that allows for both global and machine-specific settings.

## Directory Structure

```
.nconfig/
├── .config/
│   └── nvim/
│       ├── auto-installers.vim
│       ├── init.vim
│       └── neovim/
│           └── specific.vim
├── .local/
│   └── share/
│       └── nvim/
│           └── site/
│               └── common/
│                   ├── auto-installers.vim
│                   ├── filetypes.vim
│                   ├── mappings.vim
│                   ├── plugin_config.vim
│                   ├── plugins.vim
│                   ├── settings.vim
│                   └── undo.vim
```

## Installation

1. **Clone this repository** to your home directory or a location of your choice:
   ```sh
   git clone <repo-url> ~/Development/nvim-config
   ```

2. **Symlink your config:**
   ```sh
   mkdir -p ~/.config
   ln -s ~/Development/nvim-config/.config/nvim ~/.config/nvim
   ```

3. **Start Neovim:**
   ```sh
   nvim
   ```
   On first launch, the configuration will automatically attempt to install [vim-plug](https://github.com/junegunn/vim-plug) and all plugins specified in your config.

## Configuration Overview

- `init.vim`: Main entry point. Loads plugin manager, plugins, and all modular config files.
- `auto-installers.vim`: Ensures vim-plug is installed automatically.
- `neovim/specific.vim`: Place for host- or user-specific overrides.
- `~/.local/share/nvim/site/common/`: Modular config files for settings, mappings, plugins, etc.

## Updating Plugins

Inside Neovim, run:
```
:PlugUpdate
```

## Notes
- If you add custom plugins, edit `~/.local/share/nvim/site/common/plugins.vim`.
- For custom settings, mappings, or filetypes, edit the corresponding files in `common/`.
- For machine-specific settings, use `neovim/specific.vim`.

## Troubleshooting
If vim-plug fails to install automatically, follow the instructions at [vim-plug](https://github.com/junegunn/vim-plug) to install it manually, then restart Neovim.

---

**Happy Vimming!**
