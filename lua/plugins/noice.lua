return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  config = function()
    local config = {
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true,
      },
      messages = {
        enabled = false,
        border = {
          enabled = false,
        },
      },
      notify = {
        enabled = false,
      },
      views = {
        notify = {
          merge = true,
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
        override = {
          -- ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- ['vim.lsp.util.stylize_markdown'] = true,
          -- ["cmp.entry.get_documentation"] = true,
        },
      },
    }

    require("noice").setup(config)
  end,

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
