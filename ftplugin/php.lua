local dap = require "dap"
-- local dap_install = require "dap-install"

local dap_install_installation_path = vim.fn.stdpath "data" .. "/dapinstall/"

dap.adapters.php = {
   type = "executable",
   command = "node",
   args = { dap_install_installation_path .. "/php_dbg/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
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
}

-- dap_install.config("php_dbg", {
--    configurations = {
--       {
--          name = "Listen for XDebug",
--          type = "php",
--          request = "launch",
--          port = 9003,
--          pathMappings = {
--             ["/home/ec2-user/www/team/marwan/"] = "${workspaceFolder}/",
--          },
--          ignore = {
--             "**/silverstripe-cache/**/*.php",
--             "**/vendor/**/*.php",
--          },
--       },
--       {
--          name = "Launch currently open script",
--          type = "php",
--          request = "launch",
--          program = "${file}",
--          cwd = "${fileDirname}",
--          port = 9000,
--       },
--    },
-- })
