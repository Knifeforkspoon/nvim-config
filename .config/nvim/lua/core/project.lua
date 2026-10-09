-- Project-local nvim configuration
--
-- A project may ship its own <project>/.nvim/ directory, providing:
--
--   1. detection  <project>/.nvim/ftdetect/*.{vim,lua}
--      Sourced per buffer on BufRead/BufNewFile. nvim's builtin detection
--      runs on the same event and is registered earlier, so these files run
--      after it and may override vim.bo.filetype. Detection happens before
--      FileType, so an ftplugin cannot do this.
--
--   2. plugins    <project>/.nvim/ftplugin/<filetype>.{vim,lua}
--      Sourced on FileType, after the builtin ftplugin loader, so they
--      override this config's after/ftplugin defaults.
--
-- Both hooks search upwards from the buffer's own path, so files opened
-- under a project resolve to that project even when cwd is elsewhere.
-- ~/.nvim is the shared data directory (vim.g.shared_directory), not a
-- project, so it is skipped when walking up.

local shared_dir = vim.fs.normalize('~/.nvim')

local function project_root(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == '' then return end
  for _, found in ipairs(vim.fs.find('.nvim', { upward = true, path = name, type = 'directory' })) do
    if found ~= shared_dir then
      return found
    end
  end
end

-- Collect <root>/<subdir>/<name>.<ext> for each ext, in the given order.
local function project_files(root, subdir, name, exts)
  local files = {}
  for _, ext in ipairs(exts) do
    local file = string.format('%s.%s', name, ext)
    local matches = vim.fn.glob(vim.fs.joinpath(root, subdir, file), false, true)
    vim.list_extend(files, matches)
  end
  return files
end

-- Detection: runs after builtin detection, may set vim.bo.filetype.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  callback = function(args)
    local root = project_root(args.buf)
    if not root then return end
    local files = project_files(root, 'ftdetect', '*', { 'vim', 'lua' })
    if #files == 0 then return end
    vim.api.nvim_buf_call(args.buf, function()
      for _, path in ipairs(files) do
        vim.cmd.source(path)
      end
    end)
  end,
})

-- Filetype plugins: match :runtime! order (vim before lua), overriding the
-- builtin loader. Runtime ftplugins guard on b:did_ftplugin and have already
-- run, so clear the guard to let the project file execute on top of them.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local root = project_root(args.buf)
    if not root then return end
    local filetype = vim.bo[args.buf].filetype
    local paths = project_files(root, 'ftplugin', filetype, { 'vim', 'lua' })
    if #paths == 0 then return end
    vim.b[args.buf].did_ftplugin = nil
    for _, path in ipairs(paths) do
      vim.cmd.source(path)
    end
  end,
})
