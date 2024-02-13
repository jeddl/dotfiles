return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function(_, _)
      require("gruvbox").setup({
        terminal_colors = true,
        invert_selection = false,
        contrast = "soft",
        transparent_mode = true,
        overrides = {
          PmenuSel = { bg = "#ff9900", fg = "white" },
        },
        inverse = true,
      })
      -- require("notify").setup({
      --   background_colour = "#000000",
      -- })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
      },
      lualine_bold = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
      -- theme = "dragon",
      colors = {
        theme = {
          all = { ui = {
            bg_gutter = "none",
            float = { bg = "#3d5066" },
          } },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
