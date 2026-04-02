-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("tokyonight").load({ style = "storm" })
vim.g.neovide_show_border = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_trail_size = 2.0
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_scale_factor = 0.75
vim.o.guifont = "JetBrainsMonoNL Nerd Font Mono"
