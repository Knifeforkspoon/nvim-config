" Auto-install vim-plug if not found

" Define paths
let s:plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
let s:plug_dir = fnamemodify(s:plug_path, ':h')
let g:plug_home = expand('~/.config/nvim/plugged')

" Create necessary directories
if !isdirectory(s:plug_dir)
  call mkdir(s:plug_dir, 'p', 0o700)

endif

if !isdirectory(g:plug_home)
  call mkdir(g:plug_home, 'p', 0o700)

endif

" Install vim-plug if not found
if empty(glob(s:plug_path))

  execute '!curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs ' .
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  
  if v:shell_error
    echoerr 'Failed to install vim-plug. Please install it manually.'
    finish
  endif
  

  
  " Set a flag to indicate we need to install plugins after vim-plug is loaded
  let g:plug_just_installed = 1
  
  " Source the newly installed vim-plug
  execute 'source ' . fnameescape(s:plug_path)
  
  " Install plugins on VimEnter
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  
  finish
endif

" If we get here, vim-plug is already installed
if !exists('g:plug_just_installed')
  " Check if plugins are installed
  let s:plugins_dir = expand('~/.local/share/nvim/plugged')
  let s:plugins_installed = isdirectory(s:plugins_dir) && !empty(glob(s:plugins_dir . '/*'))
  
  if !s:plugins_installed
    echo 'Installing plugins...'
    execute 'source ' . fnameescape(s:plug_path)
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif
