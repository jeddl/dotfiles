return {
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
