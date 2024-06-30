return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function(_, _)
      require("gruvbox").setup({
        terminal_colors = true,
        invert_selection = false,
        contrast = "soft",
        transparent_mode = true,
        palette_overrides = {},
        overrides = {
          -- reference: https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox.lua
          Function = { fg = "#d3869b", bold = true }, -- purple
          CmpItemKindFunction = { fg = "#d3869b", bold = true }, -- purple
          CmpItemKindMethod = { fg = "#d3869b", bold = true }, -- purple

          ["@parameter"] = { fg = "#8ec07c" }, -- aqua
          ["@variable"] = { fg = "#83a598" }, -- blue
          ["@type"] = { fg = "#d79921" }, -- neutral yellow
          ["@constructor"] = { fg = "#cecb94" }, -- yellow
          ["@namespace"] = { fg = "#f2e5bc" }, -- light soft
        },
        inverse = true,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        -- floats = { bg = "#3d5066" },
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
      groups = {},
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
      -- colorscheme = "rose-pine",
      -- colorscheme = "tokyonight",
      colorscheme = "gruvbox",
    },
  },
}
