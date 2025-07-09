" Basic settings
set nocompatible
set noswapfile
set number
set ruler
set hlsearch

" Enable 24-bit color support
" if has('termguicolors')
"   echom "Enabling termguicolors"
"   set termguicolors
" endif

" Disable beep and visual bell
set visualbell
set t_vb=

" Colorscheme will be set by plugin_config.vim after plugins load

" Whitespace highlighting
highlight ExtraWhitespace ctermbg=Magenta guibg=Magenta
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Default tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" Enable filetype detection and plugin loading
filetype plugin indent on
syntax enable
