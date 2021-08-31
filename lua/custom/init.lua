local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
   local opt = { silent = true }

   map("v", "<", [[<gv]], opt)
   map("v", ">", [[>gv]], opt)

   map("n", "<A-j>", ":resize -10<CR>", opt)
   map("n", "<A-k>", ":resize +10<CR>", opt)
   map("n", "<A-l>", ":vertical resize -10<CR>", opt)
   map("n", "<A-h>", ":vertical resize +10<CR>", opt)
end)

hooks.add("install_plugins", function(use)
   local config = function(name)
      return string.format("require('plugins.configs.%s')", name)
   end

   local use_with_config = function(path, name)
      use { path, config = config(name) }
   end
   -- basic
   use {
      "tpope/vim-surround",
   }
   use_with_config("windwp/nvim-spectre", "spectre")

   --    use {
   --       "aserowy/tmux.nvim",
   --       config = function()
   --          local present, tmux = pcall(require, "tmux")
   --          if not present then
   --             return
   --          end
   --
   --          tmux.setup {
   --             copy_sync = {
   --                enable = false, -- since clipboard is set to unnamed already
   --             },
   --             navigation = {
   --                enable_default_keybindings = true, -- enables c-hjkl for navigation
   --             },
   --             resize = {
   --                enable_default_keybindings = true, -- enables alt/option-hjkl for resizing
   --             },
   --          }
   --       end,
   --    }

   -- text objects
   -- use "wellle/targets.vim" -- many useful additional text objects

   -- registers
   -- use_with_config("svermeulen/vim-subversive", "subversive") -- adds substitute operator
   use_with_config("svermeulen/vim-cutlass", "cutlass") -- separates cut and delete operations
   -- use_with_config("svermeulen/vim-yoink", "yoink") -- improves paste
   -- shows register contents intelligently
   -- use {
   --    "tversteeg/registers.nvim",
   -- }

   -- lsp
   -- use_with_config("RRethy/vim-illuminate", "illuminate") -- highlights and allows moving between variable references

   -- treesitter
   use {
      "RRethy/nvim-treesitter-textsubjects", -- adds smart text objects
      ft = { "lua", "typescript", "typescriptreact" },
   }
   use { "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }

   -- development
   use_with_config("vuki656/package-info.nvim", "package-info") -- show versions in package.json

   -- dap
   use_with_config("mfussenegger/nvim-dap", "dap")
   use {
      "rcarriga/nvim-dap-ui",
      config = function()
         require "plugins.configs.dap-ui"
      end,
   }

   -- testing
   -- use {
   --    "vim-test/vim-test",
   --    setup = function()
   --       require("plugins.configs.vim-test").setup()
   --    end,
   -- }

   -- use {
   --    "David-Kunz/jester",
   -- }
end)
