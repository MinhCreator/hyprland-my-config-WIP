return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local line = require("userConfigs.statusline")
		local lualine = require("lualine")
		lualine.setup(line)
	end,
}
