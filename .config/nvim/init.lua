vim.g.mapleader = ' '

local shared_directory = vim.fn.expand("~/.local/share/nvim/site")
vim.g.shared_directory = shared_directory

-- Completely disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0


-- Load plugins with lazy
require('plugins')

-- Load core lua settings
require('core')

-- Load lsp settings
require('lsp')
