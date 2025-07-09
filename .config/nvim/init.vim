set nocompatible

source ~/.local/share/nvim/site/common/auto-installers.vim

call plug#begin('~/.config/nvim/plugged')

source ~/.local/share/nvim/site/common/plugins.vim

" Finalize the plugin system.
call plug#end()
" -------------------------

" --- LOAD THE REST OF YOUR CONFIGURATION ---
source ~/.local/share/nvim/site/common/settings.vim
source ~/.local/share/nvim/site/common/filetypes.vim
source ~/.local/share/nvim/site/common/mappings.vim
source ~/.local/share/nvim/site/common/plugin_config.vim
source ~/.local/share/nvim/site/common/undo.vim
source ~/.config/nvim/neovim/specific.vim