local function get_platform_name()
  if vim.fn.has("mac") == 1 then return "mac" end
  if vim.fn.has("linux") == 1 then return "linux" end
  if vim.fn.has("win32") == 1 then return "windows" end
  return "default"
end

local platform = get_platform_name()
if platform == "default" then return end

local platform_path = vim.fn.stdpath("config") .. "/lua/core/platform/" .. platform .. ".lua"
if vim.uv.fs_stat(platform_path) == nil then
  return
end

local ok, config = pcall(require, "core.platform." .. platform)
if not ok then return end

for key, value in pairs(config) do
  vim.opt[key] = value
end
