local dap = require "dap"
-- local dap_install = require "dap-install"

local home_programs = vim.fn.getenv "HOME" .. "/programs"
dap.set_log_level "TRACE"
dap.adapters.php = {
   type = "executable",
   command = "node",
   args = { home_programs .. "/vscode-php-debug/out/phpDebug.js" },
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
      -- stopOnEntry = true,
      ignore = {
         "**/silverstripe-cache/**/*.php",
         "**/vendor/**/*.php",
      },
      hostname = "0.0.0.0",
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
