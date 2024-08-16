return {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
   require("lualine").setup({
    options = {
     icons_enabled = false,
     theme = "everforest",
     component_separators = "|",
     section_separators = "",
    },
   })
  end,
 }
