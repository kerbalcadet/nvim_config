-- RUST MINI.PAIRS
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("rust_disable_single_quote_pairs"),
  pattern = "rust",
  callback = function()
    vim.keymap.set("i", "'", "'", { buffer = 0 })
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
