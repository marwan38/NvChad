local M = {}

M.dap = {
   config = {
      breakpoint = {
         text = "",
         texthl = "LspDiagnosticsSignError",
         linehl = "",
         numhl = "",
      },
   },
   setup = function()
      local present, dap = pcall(require, "dap")

      if not present then
         return
      end

      vim.fn.sign_define("DapBreakpoint", M.dap.config)
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
   end,
}

M.dap_install = {
   setup = function()
      local present, dap_install = pcall(require, "dap-install")

      if not present then
         return
      end

      dap_install.setup {
         installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
         verbosely_call_debuggers = false,
      }
   end,
   config = function()
      local present, dap_install = pcall(require, "dap-install")

      if not present then
         return
      end

      dap_install.config("php_dbg", {
         configurations = {
            {
               name = "Listen for XDebug",
               type = "php",
               request = "launch",
               port = 9003,
               pathMappings = {
                  ["/home/ec2-user/www/team/marwan/"] = "${workspaceFolder}/",
               },
               ignore = {
                  "**/silverstripe-cache/**/*.php",
                  "**/vendor/**/*.php",
               },
            },
            {
               name = "Launch currently open script",
               type = "php",
               request = "launch",
               program = "${file}",
               cwd = "${fileDirname}",
               port = 9000,
            },
         },
      })
   end,
}

return M
