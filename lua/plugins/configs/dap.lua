local M = {}

M.dap = {
   config = function()
      --       local present, dap = pcall(require, "dap")
      --
      --       if not present then
      --          return
      --       end

      local dap = require "dap"

      vim.fn.sign_define("DapBreakpoint", {
         text = "",
         texthl = "LspDiagnosticsSignError",
         linehl = "",
         numhl = "",
      })
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
   end,
}

M.dap_install = {
   config = function()
      --       local present, dap_install = pcall(require, "dap-install")
      --
      --       if not present then
      --          return
      --       end

      local dap_install = require "dap-install"

      dap_install.setup {
         installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
         verbosely_call_debuggers = false,
      }
   end,
}

return M
