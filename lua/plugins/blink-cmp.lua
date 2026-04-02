return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      ["<CR>"] = { "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.accept()
          end
        end,
        "fallback",
      },
    },
  },
}
