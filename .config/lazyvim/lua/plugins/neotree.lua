return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
  },
  -- Do not open neo tree when opening a directory
  init = function() end,
}
