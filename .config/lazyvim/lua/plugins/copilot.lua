return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-CR>",
          next = "<C-j>",
          prev = "<C-i>",
        },
      },
      panel = {
        enabled = false,
      },
    },
    fileTypes = {
      typescript = true,
      javascript = true,
      terraform = true,
      go = true,
      python = true,
      yaml = true,
      markdown = true,
    },
  },
}
