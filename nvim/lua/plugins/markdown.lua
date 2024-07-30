return {
  -- Better MarkDown writing
  "ixru/nvim-markdown",
  -- Show math equations prettier
  "jbyuki/nabla.nvim",
  -- Table mode for MarkDown
  "dhruvasagar/vim-table-mode",
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
