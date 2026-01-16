dofile(vim.g.base46_cache .. "lsp")
local lspconfig = require("lspconfig")
local lsp = require("configs.lsp")
local map = vim.keymap.set
-- lsp with multiple language server config

lspconfig.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
	-- map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "Renamer")
	map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Renamer"))
end

-- disable semanticTokens
lspconfig.on_init = function(client, _) end

lspconfig.capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

lspconfig.defaults = function()
	require("lspconfig.lsp").diagnostic_config()

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			lspconfig.on_attach(_, args.buf)
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
					signs = false,
				})
		end,
	})

	-- Support 0.10 temporarily

	-- if vim.lsp.config then
	--   vim.lsp.config("*", { capabilities = lspconfig.capabilities, on_init = lspconfig.on_init })
	--   vim.lsp.enable "lua_ls"
	-- else
	--   require("lspconfig").lua_ls.setup {
	--     capabilities = lspconfig.capabilities,
	--     on_init = lspconfig.on_init,
	--   }
	-- end
end
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- lspconfig.emmet_language_server.setup({
-- 	filetypes = { "html", "javascript", "css", "python", "*" },
-- 	-- capabilities = capabilities,
-- })

for _, lsp in ipairs(lsp.server) do
	lspconfig[lsp].setup({
		on_attach = lspconfig.on_attach,
		on_init = lspconfig.on_init,
		capabilities = lspconfig.capabilities,
	})
end
