local M = {}

M.setup = function()
   vim.g["test#strategy"] = "neovim"
   vim.g["test#javascript#jest#options"] = '--maxWorkers=4 --silent --cacheDirectory="node_modules/.cache/jest"'

   vim.g["test#php#phpunit#options"] = "--bootstrap vendor/silverstripe/framework/tests/bootstrap.php"
end

return M
