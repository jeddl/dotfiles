return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      win_options = {
        conceallevel = { default = 0, rendered = 3 }, -- 3 is the plugin's native default for concealing
      },
      code = {
        enabled = false,
      },
      heading = {
        enabled = true,
      },
      checkbox = {
        enabled = true,
      },
      pipe_table = {
        enabled = true,
      },
    },
  },
}
