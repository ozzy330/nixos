return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
	dependencies = {
		-- Better MarkDown writing
		"ixru/nvim-markdown",
		-- Show math equations prettier
		"jbyuki/nabla.nvim",
		-- Table mode for MarkDown
		"dhruvasagar/vim-table-mode",
	},
	opts = {},
}
