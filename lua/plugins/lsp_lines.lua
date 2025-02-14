return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  config = function()
    require('lsp_lines').setup()

    vim.keymap.set('n', '<leader>k', "<cmd>lua require('lsp_lines').toggle()<cr>")

    -- Disable virtual text; this turns lsp_lines off by default
    vim.diagnostic.config { virtual_lines = false }
  end,
}
