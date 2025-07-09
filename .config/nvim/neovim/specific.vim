" Neovim-specific settings

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold (default is 4000ms)
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use system clipboard by default
set clipboard+=unnamedplus

" Better terminal integration
if has('nvim')
  " Use terminal keycodes in the terminal
  tnoremap <Esc> <C-\><C-n>
  
  " Escape terminal insert mode with jk
  tnoremap jk <C-\><C-n>
  
  " Open terminal in insert mode
  autocmd TermOpen * startinsert
  
  " Terminal window navigation
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  
  " Terminal mode mappings
  tnoremap <C-w> <C-\><C-n><C-w>
  
  " Better terminal colors
  let g:terminal_color_0  = '#2e3436'
  let g:terminal_color_1  = '#cc0000'
  let g:terminal_color_2  = '#4e9a06'
  let g:terminal_color_3  = '#c4a000'
  let g:terminal_color_4  = '#3465a4'
  let g:terminal_color_5  = '#75507b'
  let g:terminal_color_6  = '#0b939b'
  let g:terminal_color_7  = '#d3d7cf'
  let g:terminal_color_8  = '#555753'
  let g:terminal_color_9  = '#ef2929'
  let g:terminal_color_10 = '#8ae234'
  let g:terminal_color_11 = '#fce94f'
  let g:terminal_color_12 = '#729fcf'
  let g:terminal_color_13 = '#ad7fa8'
  let g:terminal_color_14 = '#00f5e9'
  let g:terminal_color_15 = '#eeeeec'
endif

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better buffer navigation
nnoremap <silent> <leader>bn :bnext<CR>
noremap <silent> <leader>bp :bprevious<CR>
noremap <silent> <leader>bd :bdelete<CR>

" Better split management
set splitright
set splitbelow

" Persistent undo
if exists('*SetupUndo')
  call SetupUndo('~/.config/nvim/undo')
endif