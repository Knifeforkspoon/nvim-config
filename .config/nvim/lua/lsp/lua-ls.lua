vim.lsp.config('lua', {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim", "Snacks" },
        disable = { "trailing-space" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      hint = {
        enable = true,
        arrayIndex = "Enable",
        await = true,
        paramName = "All",
        paramType = true,
        semicolon = "Disable",
        setType = true,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
