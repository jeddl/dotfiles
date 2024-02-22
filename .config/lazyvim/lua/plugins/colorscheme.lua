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
        floats = { bg = "#3d5066" },
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
    "rose-pine/neovim",
    opts = {
      variant = "main",
      dark_variant = "main",
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
      groups = {
        -- panel = { bg = "#3d5066" },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      -- require("notify").setup({ background_colour = "#3d5066" })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
      colorscheme = "rose-pine",
      -- colorscheme = "tokyonight",
    },
  },
}
