return {
  "folke/snacks.nvim",
  opts = {
    explorer = { enabled = true, replace_netrw = true, follow_root = true, follow_file = true },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
            },
          },
        },
      },
    },
  },
}
