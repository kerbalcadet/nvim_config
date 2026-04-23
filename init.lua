vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--query-driver=/home/nick/.platformio/packages/toolchain-riscv32-esp/bin/riscv32-esp-elf-g++",
  },
  root_markers = { "compile_commands.json", "compile_flags.txt" },
  filetypes = { "c", "cpp" },
}
vim.lsp.enable({ "clangd", "rust-analyzer" })

vim.diagnostic.config({
  float = {
    border = "rounded",
    source = "always",
    format = function(diagnostic)
      return diagnostic.message
    end,
  },
})

require("config.lazy")
vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.o.guifont = "JetBrainsMonoNL Nerd Font:h16"

--require("kanagawa").load("wave")
--require("tokyonight").load({ style = "storm" })
vim.cmd.colorscheme("prismatic")

-- remove background
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
--vim.api.nvim_set_hl(0, "CursorLine", { bg = "#203040" })
--vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#203040" })
--vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#203040" })
--vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
--vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
--vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
