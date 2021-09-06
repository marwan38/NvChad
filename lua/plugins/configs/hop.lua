local M = {}

M.config = function()
   local status_ok, hop = pcall(require, "hop")
   if not status_ok then
      return
   end
   hop.setup()
   vim.api.nvim_set_keymap("", "<leader>SL", ":HopChar1<cr>", { silent = true })
   vim.api.nvim_set_keymap("", "<leader>SO", ":HopWord<cr>", { silent = true })
end

return M
