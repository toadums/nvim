return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    opts.formatting = {
      format = function(entry, vim_item)
        -- UNCOMMENT TO SHOW THE SOURCE OF SUGGESTION
        -- vim_item.menu = ({
        --   nvim_lsp = "[LSP]",
        --   vsnip = "[Snippet]",
        --   nvim_lua = "[Nvim Lua]",
        --   buffer = "[Buffer]",
        -- })[entry.source.name]

        vim_item.dup = ({
          vsnip = 0,
          nvim_lsp = 0,
          nvim_lua = 0,
          buffer = 0,
        })[entry.source.name] or 0

        return vim_item
      end,
    }
  end,
}
