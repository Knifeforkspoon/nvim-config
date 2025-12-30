vim.lsp.config.yaml = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
        ["https://json.schemastore.org/github-action.json"] = ".github/action.yml",
        ["https://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/*.{yml,yaml}",
        ["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.yml",
        ["https://json.schemastore.org/stylelintrc.json"] = ".stylelintrc.yml",
        ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/config.yml",
      },
      validate = true,
      hover = true,
      completion = true,
    },
  },
}