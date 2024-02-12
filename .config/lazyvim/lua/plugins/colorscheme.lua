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
      require("notify").setup({
        background_colour = "#000000",
      })
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
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function(_, _)
      require("rose-pine").setup({
        variant = "auto",
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = "moon",
        disable_italics = true,
        highlight_groups = {
          -- Blend colours against the "base" background
          -- CursorLine = { bg = "foam", blend = 15 },
          -- NormalFloat = { bg = "foam", blend = 10 },
          -- FloatBorder = { bg = "love", blend = 15 },
          -- Pmenu = { bg = "foam" },
          -- PmenuSel = { bg = "pine", blend = 20 },
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
