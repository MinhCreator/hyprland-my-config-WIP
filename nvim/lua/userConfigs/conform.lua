local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		-- remove white space
		python = { "isort", "black" },
		["_"] = { " trim_whitespace" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		-- lsp_fallback = true,
		lsp_fallback = "fallback",
	},
}

return options
