" Key mappings

" Toggle NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>

" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@\",'/\\')<CR><CR>

" Uncomment to enable Copilot toggle
" nnoremap <C-c-t> :call ToggleCopilot()<CR>
" inoremap <C-c-t> <Esc>:call ToggleCopilot()<CR>a