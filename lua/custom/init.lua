local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
   local opt = {}

   map("v", "<", [[<gv]])
   map("v", ">", [[>gv]])
end)

hooks.add("install_plugins", function(use)
   local config = function(name)
      return string.format("require('plugins.configs.%s')", name)
   end

   local use_with_config = function(path, name)
      use { path, config = config(name) }
   end

   use {
      "tpope/vim-surround",
   }

   use {
      "aserowy/tmux.nvim",
      config = function()
         local present, tmux = pcall(require, "tmux")
         if not present then
            return
         end

         tmux.setup {
            copy_sync = {
               enable = false, -- since clipboard is set to unnamed already
            },
            navigation = {
               enable_default_keybindings = true, -- enables c-hjkl for navigation
            },
            resize = {
               enable_default_keybindings = true, -- enables alt/option-hjkl for resizing
            },
         }
      end,
   }

   -- text objects
   use "wellle/targets.vim" -- many useful additional text objects

   -- registers
   -- use_with_config("svermeulen/vim-subversive", "subversive") -- adds substitute operator
   -- use_with_config("svermeulen/vim-cutlass", "cutlass") -- separates cut and delete operations
   -- use_with_config("svermeulen/vim-yoink", "yoink") -- improves paste
   use("tversteeg/registers.nvim", "registers") -- shows register contents intelligently

   -- lsp
   use_with_config("RRethy/vim-illuminate", "illuminate") -- highlights and allows moving between variable references

   -- treesitter
   use {
      "RRethy/nvim-treesitter-textsubjects", -- adds smart text objects
      ft = { "lua", "typescript", "typescriptreact" },
   }
   use { "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }

   -- dap
   use {
      "mfussenegger/nvim-dap",
      config = function()
         require("plugins.configs.dap").dap.config()
         require("core.mappings").dap()
      end,
   }

   use {
      "Pocco81/DAPInstall.nvim",
      config = function()
         require("plugins.configs.dap").dap_install.config()
      end,
   }

   use {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = function()
         require "plugins.configs.dap-ui"
      end,
   }

   use {
      "vim-test/vim-test",
      setup = function()
         require("plugins.configs.vim-test").setup()
      end,
   }

   use {
      "David-Kunz/jester",
   }
end)
