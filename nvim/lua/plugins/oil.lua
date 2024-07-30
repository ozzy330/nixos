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
			show_hidden = true,
			sort = {
				{ "name", "asc" },
			},
		}
	},
	vim.keymap.set('n', 'ff', ":Oil<CR>", { silent = true }),
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
