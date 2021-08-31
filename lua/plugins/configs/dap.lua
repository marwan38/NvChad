local dap = require "dap"
local utils = require "core.utils"
local map = utils.map

vim.fn.sign_define("DapBreakpoint", {
   text = "",
   texthl = "LspDiagnosticsSignError",
   linehl = "",
   numhl = "",
})
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

local key_bindings = {
   toggle_breakpoint = "<leader>dt",
   step_back = "<leader>db",
   continue = "<leader>dc",
   run_to_cursor = "<leader>dC",
   disconnect = "<leader>d",
   get_session = "<leader>dg",
   step_into = "<leader>di",
   step_over = "<leader>do",
   step_out = "<leader>du",
   pause = "<leader>dp",
   toggle_repl = "<leader>dr",
   start_dap = "<leader>ds",
   quit_dap = "<leader>dq",
}

map("n", key_bindings.toggle_breakpoint, ":lua require'dap'.toggle_breakpoint() <CR>")
map("n", key_bindings.step_back, ":lua require'dap'.step_back() <CR>")
map("n", key_bindings.continue, ":lua require'dap'.continue() <CR>")
map("n", key_bindings.run_to_cursor, ":lua require'dap'.run_to_cursor() <CR>")
map("n", key_bindings.disconnect, ":lua require'dap'.disconnect() <CR>")
map("n", key_bindings.get_session, ":lua require'dap'.get_session() <CR>")
map("n", key_bindings.step_into, ":lua require'dap'.step_into() <CR>")
map("n", key_bindings.step_over, ":lua require'dap'.step_over() <CR>")
map("n", key_bindings.step_out, ":lua require'dap'.step_out() <CR>")
map("n", key_bindings.pause, ":lua require'dap'.pause.toggle() <CR>")
map("n", key_bindings.toggle_repl, ":lua require'dap'.repl.toggle() <CR>")
map("n", key_bindings.start_dap, ":lua require'dap'.continue() <CR>")
map("n", key_bindings.quit_dap, ":lua require'dap'.close() <CR>")
