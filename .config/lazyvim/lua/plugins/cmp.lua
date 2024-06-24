return {
  -- Super Tab for auto completion
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- setup = {
      -- prevent 2 rust analyzer running if installed by Mason, which does not start automatically
      -- if rust analyzer is installed manually, this function can be removed
      -- note that it's recommended to install rust via rustup
      -- rust_analyzer = function()
      --   return true
      -- end,
      -- },
      inlay_hints = {
        enabled = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      cmp.setup({
        -- Automatically highlight the first suggestion
        preselect = "None",
        completion = {
          completeopt = "menu, menuone, noinsert",
        },

        -- Add borders to the completion menu
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
      -- Completion menu transparency
      vim.opt.pumblend = 0

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
            -- cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
