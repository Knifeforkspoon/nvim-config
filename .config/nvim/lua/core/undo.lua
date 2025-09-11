-- undo.lua - Function to configure persistent undo

function SetupUndo(undo_path)
  -- Enable persistent undo
  vim.opt.undofile = true

  -- Set the undo directory
  vim.opt.undodir = undo_path
  vim.opt.undolevels = 100

  -- Create the undo directory if it doesn't exist
  if vim.fn.isdirectory(undo_path) == 0 then
    vim.fn.mkdir(undo_path, 'p')
  end
end

if SetupUndo then
  local shared_directory = vim.g.shared_directory
  local undo = string.format("%s/%s", shared_directory, 'undo')
  SetupUndo(undo)
end
