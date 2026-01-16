return {
	"nvim-java/nvim-java",
	{
		"mfussenegger/nvim-jdtls",
		otp = function()
			require("lspconfig").jdtls.setup({})
		end,
	},
}
