return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			nix = { "nixfmt" },
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "gofmt" },
			javascript = { "prettierd", "eslint_d" },
			json = { "prettierd" },
			markdown = { "prettierd" },
			typescript = { "prettier", "eslint_d" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
