dofile(vim.g.base46_cache .. "cmp")
return {
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		lazy = true,
		dependencies = {
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"brenoprata10/nvim-highlight-colors", -- "tailwind-tools",
			-- "onsails/lspkind-nvim",
			"lukas-reineke/cmp-rg",
		},
		config = function(_, opts)
			local icon = require("userConfigs.iconCmp")
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone" },
				window = {
					completion = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
						scrollbar = false,
					},
					-- documentation = {
					--     border = border "CmpDocBorder",
					--     winhighlight = "Normal:CmpDoc",
					-- },
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = vim_item.kind
						local highlights_info = require("colorful-menu").cmp_highlights(entry)
						-- Kind icons
						-- vim_item.kind = (icon[kind] or "?") .. " " -- This concatenates the     icons with the name of the item kind
						-- vim_item.menu = " " .. kind .. " " .. entry.source.name
						-- Source

						if entry.source.name == "calc" then
							vim_item.kind = icon.Calc
							-- return vim_item
						end
						if highlights_info ~= nil then
							vim_item.abbr_hl_group = highlights_info.highlights
							vim_item.abbr = highlights_info.text
						end
						vim_item.menu = ({
							nvim_lsp = "LSP",
							nvim_lua = "LUA",
							luasnip = "Snippet",
							buffer = "Buffer",
							path = "Path",
							calc = "Calc",
							emoji = "Emoji",
							crates = "Crate",
						})[entry.source.name]
						return vim_item
					end,
					-- require("lspkind").cmp_format({
					--     before = require("tailwind-tools.cmp").lspkind_format
					-- }),
				},
				sources = {
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "rg" },
					--{ name = "nvim_lua" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "crates" },
					{ name = "calc" },
					{ name = "luasnip" },
				},

				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<Esc>"] = cmp.mapping.close(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
			})
		end,
	},
	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("userConfigs.bracket-pair")
		end,
	},
	-- cmdline
	{
		"hrsh7th/cmp-cmdline",
		event = "VeryLazy",
		config = function()
			require("userConfigs.cmdline")
		end,
	},
}
