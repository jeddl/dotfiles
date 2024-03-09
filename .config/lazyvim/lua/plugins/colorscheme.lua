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
          -- ["@lsp.type.method"] = { fg = "#d3869b" },
          -- ["@lsp.type.function"] = { fg = "#d3869b" },
          ["@lsp.type.class"] = { fg = "#cecb94" },
          ["@lsp.type.interface"] = { fg = "#cecb94" },
          ["@lsp.type.struct"] = { fg = "#cecb94" },
          ["@lsp.type.type"] = { fg = "#cecb94" },
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
