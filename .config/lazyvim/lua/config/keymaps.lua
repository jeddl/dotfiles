-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Normal Mode
vim.keymap.set("n", "<leader>w", ":wa<cr>", { remap = true, desc = "Save Changes" })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen origin/main<CR>", { silent = true, desc = "Main Branch Diff Check" })
vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { silent = true, desc = "Close Diff View" })
vim.keymap.set(
  "n",
  "<leader>hm",
  ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { silent = true, desc = "Toggle Harpoon Menu" }
)
vim.keymap.set(
  "n",
  "<leader>ha",
  ":lua require('harpoon.mark').add_file()<CR>",
  { silent = true, desc = "Add File to Harpoon" }
)
vim.keymap.set(
  "n",
  "<C-n>",
  ":lua require('harpoon.ui').nav_next()<CR>",
  { silent = true, desc = "Harpoon Nav to the Next File" }
)
vim.keymap.set(
  "n",
  "<C-p>",
  ":lua require('harpoon.ui').nav_prev()<CR>",
  { silent = true, desc = "Harpoon Nav to the Previous File" }
)

-- Insert Mode
vim.keymap.set("i", "jk", "<esc>", { noremap = true, desc = "Escape" })

-- Visual Mode
