return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
    window = {
      width = 60,
      mappings = {
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "copy path to clipboard",
        },
      },
    },
  },
  -- Do not open neo tree when opening a directory
  init = function() end,
}
