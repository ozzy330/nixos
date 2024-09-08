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
			nasm = { "nasmfmt" },
			nginx = { "nginxfmt" },
			yaml = { "prettier" },
			gdscript = { "gdformat" },
			typst = { "typstyle" },
			php = { "pint" },
		},

		formatters = {
			nasmfmt = {
				command = "nasmfmt",
				args = { "$FILENAME" },
				stdin = false,
			},
			nginxfmt = {
				command = "nginxfmt",
				args = { "$FILENAME" },
				stdin = false,
			},
			gdformat = {
				command = "gdformat",
				args = { "$FILENAME" },
				stdin = false,
			},
		},

		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
