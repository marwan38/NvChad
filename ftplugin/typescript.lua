local opt = vim.opt

opt.shiftwidth = 4;

local dap = require "dap"
-- 
local dap_install_installation_path = vim.fn.stdpath "data" .. "/dapinstall/"
-- 
dap.adapters.node2 = {
   type = "executable",
   command = "node",
   args = { dap_install_installation_path .. "/jsnode_dbg/vscode-node-debug2/out/src/nodeDebug.js" },
}
-- 
-- local path_to_jest = "node_modules/.bin/jest"
-- dap.configurations.javascript = { -- change to typescript if needed
--    {
--       name = "Jest runner",
--       type = "node2",
--       request = "launch",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       console = "integratedTerminal",
--       runtimeArgs = { "--inspect-brk", path_to_jest, "--no-coverage", -t, "$result", "--", "$file" },
--    },
-- }
-- 
-- dap.configurations.typescript = dap.configurations.javascript
-- dap.configurations.typescriptreact = dap.configurations.javascript
