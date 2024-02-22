return {
  -- notify: Will be needed when setting background transparent
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#181825",
    },
  },
  -- Spell check
  { "kamykn/spelunker.vim" },
  -- Note
  {
    "vimwiki/vimwiki",
    config = function()
      vim.cmd(
        "let g:vimwiki_list = [{'path': '~/Documents/vim-wiki-note/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]"
      )
    end,
  },
}
