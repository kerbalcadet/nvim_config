require("rust-tools").setup({
  server = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = true,
          disabled = {},
          hints = {
            enable = true,
          },
        },
        inlayHints = {
          enable = true,
        },
        -- Enable more detailed diagnostic messages from the compiler
        assist = {
          importMergeBehaviour = "last",
          importPrefix = "by_self",
        },
      },
    },
  },
})
