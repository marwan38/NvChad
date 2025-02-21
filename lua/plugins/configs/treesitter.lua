local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts_config.setup {
   ensure_installed = "maintained",
   highlight = {
      enable = true,
      use_languagetree = true,
   },
   context_commentstring = {
      enable = true,
   },
   autotag = {
      enable = true,
   },
   textsubjects = {
      enable = true,
      keymaps = {
         ["."] = "textsubjects-smart",
         [";"] = "textsubjects-container-outer",
      },
   },
}
