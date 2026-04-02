vim.g.pioConfig = {
  lsp = "clangd",
  clangd_source = "compiledb",
  menu_key = "<leader>tt",
  debug = false,
}

-- Setup PlatformIO if available
local pok, platformio = pcall(require, "platformio")
if pok then
  platformio.setup(vim.g.pioConfig)
end
