" undo.vim - Function to configure persistent undo

function! SetupUndo(undo_path)
  " Enable persistent undo
  set undofile

  " Set the undo directory
  let s:undo_dir = expand(a:undo_path)
  let &undodir = s:undo_dir

  " Create the undo directory if it doesn't exist
  if !isdirectory(s:undo_dir)
    call mkdir(s:undo_dir, 'p')
  endif
endfunction
