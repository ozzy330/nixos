return {
	'stevearc/oil.nvim',
	opts = {
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
			sort = {
				{ "name", "asc" },
			},
		}
	},
	vim.keymap.set('n', 'ff', ":Oil<CR>", { silent = true })
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
