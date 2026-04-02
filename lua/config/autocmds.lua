vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- skip special buffers (dashboard, picker, etc.)
    if vim.bo.buftype ~= "" then
      return
    end
    if vim.bo.filetype == "snacks_dashboard" then
      return
    end
    if vim.bo.filetype == "snacks_picker" then
      return
    end

    -- skip unnamed buffers
    if vim.fn.expand("%:p") == "" then
      return
    end

    -- only run once per "project open"
    if vim.g._snacks_auto_opened then
      return
    end
    vim.g._snacks_auto_opened = true

    vim.schedule(function()
      require("snacks.explorer").open({ focus = false })
    end)
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("snacks_explorer_autorefresh", { clear = true }),
  callback = function()
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype
    if buftype ~= "" then
      return
    end
    local ignore_filetypes = { "TelescopePrompt", "snacks_picker", "snacks_dashboard", "prompt" }
    if vim.tbl_contains(ignore_filetypes, filetype) then
      return
    end

    local Snacks = require("snacks")
    local picker = Snacks.picker.get({ source = "explorer" })[1]
    if not picker then
      return
    end

    local root = LazyVim.root()
    if not root then
      return
    end

    local E = require("snacks.explorer")
    vim.schedule(function()
      -- Step 1: set explorer root to current project root
      picker:set_cwd(root)
      -- Step 2: refresh the tree
      require("snacks.explorer.actions").actions.explorer_update(picker)
      -- Step 3: reveal the current buffer
      E.reveal({ buf = vim.api.nvim_get_current_buf(), picker = picker })
    end)
  end,
})
