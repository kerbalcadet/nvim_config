return {
  "anurag3301/nvim-platformio.lua",
  event = "VeryLazy",
  config = function()
    require("platformio").setup({
      lsp = "clangd",
      clangd_source = "compiledb",
      menu_key = "<leader>pi",
      debug = true,
    })
  end,
  dependencies = {
    { "akinsho/toggleterm.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "folke/which-key.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
}
