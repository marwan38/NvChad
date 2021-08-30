local u = require "core.utils"
local map = u.map
local opts = { noremap = true }
map("n", "<leader>S", ':lua require("spectre").open()<CR>', opts)
map("n", "<leader>sw", ':lua require("spectre").open_visual({select_word=true})<CR>', opts)
-- map("n", "<leader>s", ':lua require("spectre").open_visual()<CR>', opts)
map("n", "<leader>sp", ':lua require("spectre").open_file_search()<CR>', opts)
