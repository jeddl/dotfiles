return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          -- section_separators = { left = "", right = "" },
          -- component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          component_separators = { left = "|", right = "|" },
        },
        -- sections = {},
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
