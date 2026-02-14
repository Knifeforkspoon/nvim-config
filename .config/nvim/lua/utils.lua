local M = {} -- Module table to export functions

-- Function is defined directly on the exported table M.
-- It no longer needs to be called 'local' because we are exporting it.
function M.is_python_project()
    local python_project_files = {
        "requirements.txt",
        "setup.py",
        "pyproject.toml",
        "poetry.lock",
        "Pipfile",
        "manage.py",
        "uv.lock"
    }

    -- Get the current working directory of Neovim
    local current_dir = vim.fn.getcwd()

    for _, filename in ipairs(python_project_files) do
        -- CRITICAL: Concatenate the path to create a full file path
        local full_path = current_dir .. "/" .. filename
        -- Check if the file exists at the full path
        if vim.loop.fs_stat(full_path) ~= nil then
            return true
        end
    end
    return false
end

return M -- Export the module for other files to 'require'
