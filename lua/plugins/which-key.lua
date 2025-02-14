return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      -- Turn off <leader-w> mapping
      { "<leader>w", proxy = "<c-w>", hidden = true },
    },
  },
}
