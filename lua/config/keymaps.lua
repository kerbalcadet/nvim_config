-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- "test4" "test4" "test4"
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
-- Keybind: close terminal monitor, upload, then reopen terminal monitor
local function upload_then_terminal_monitor()
  local term_buf_name = "PIO_SERIAL_MONITOR"

  -- 1️⃣ Close existing monitor buffer if it exists
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf) == term_buf_name then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  -- 2️⃣ Run the upload in a terminal buffer (blocking)
  vim.cmd("split") -- horizontal split
  local upload_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, upload_buf)
  vim.fn.termopen("pio run -t upload", {
    on_exit = function(_, exit_code, _)
      vim.schedule(function()
        if exit_code == 0 then
          print("Upload finished successfully!")
        else
          print("Upload failed with exit code:", exit_code)
        end

        -- 3️⃣ Open serial monitor in a new terminal buffer
        vim.cmd("split")
        local monitor_buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_name(monitor_buf, term_buf_name)
        vim.api.nvim_win_set_buf(0, monitor_buf)
        vim.fn.termopen("pio device monitor")
      end)
    end,
  })
end

-- Map to <leader>pu
vim.keymap.set("n", "<leader>pu", upload_then_terminal_monitor, { noremap = true, silent = true })
