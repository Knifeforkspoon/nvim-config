local utils = require('utils')
local python_project = utils.is_python_project()

if python_project then
  local python_path = '.venv/bin/python' 
  local version = vim.fn.readfile('.python-version')[1]:gsub('%s+ ', '')
  local site_packages = '.venv/lib/python' .. version .. '/site-packages'

  vim.lsp.config.pyright =  {
    filetypes = {'python'},
    root_markers = { "pyproject.yaml", ".git", "." },
    cmd = { "pyright-langserver", "--stdio" },
    settings = {
      python = {
        pythonPath = python_path,
        analysis = {
          extraPaths = { site_packages },
          include = { "src", "tests" },
          typeCheckingMode = "basic",
          diagnosticSeverityOverrides = {
            reportMissingArgument = "warn",
          },
        }
      }
    }
  }

  vim.lsp.enable({'pyright'})
end
