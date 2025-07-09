" Plugin configurations

" Disable Netrw completely
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" NERDTree settings
let g:NERDTreeIgnore = ['cmake-build.*', '\\.pyc$', '__pycache__', '\\.git', '.DS_Store']
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

" Set colorscheme directly
" set background=dark
colorscheme gruvbox

" Make NERDTree look better
" highlight NERDTreeDir ctermfg=4 guifg=#61afef
" highlight NERDTreeDirSlash ctermfg=4 guifg=#61afef
" highlight NERDTreeOpenable ctermfg=4 guifg=#61afef
" highlight NERDTreeClosable ctermfg=4 guifg=#61afef
" highlight NERDTreeExecFile ctermfg=2 guifg=#98c379

" Tags configuration
set tags=./tags;/
