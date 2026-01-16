return {
	-- Timer plugin
	{
		"nvzone/timerly",
		lazy = true,
		dependencies = { "nvzone/volt" },
		cmd = "TimerlyToggle",
	},
	-- wakatime
	{ "wakatime/vim-wakatime", lazy = false },
	-- typing
	{
		"nvzone/typr",
		lazy = true,
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
	},
	-- ui
	{
		-- ui library
		"nvim-lua/plenary.nvim",
		-- bufferline
		{
			"akinsho/bufferline.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
			version = "*",
			opts = function()
				require("userConfigs.tabline")
			end,
		},

		{
			"MinhCreator/nvui-fork",
			enabled = false,
			config = function()
				require("nvchad")
			end,
		},

		{
			"nvchad/ui",
			-- enabled = false,
			config = function()
				require("nvchad")
			end,
		},
		-- colorscheme
		{
			"nvchad/base46",
			lazy = true,
			build = function()
				require("base46").load_all_highlights()
			end,
		},
		{
			"NvChad/NvChad",
		},
		-- menu
		{
			"nvzone/menu",
			lazy = true,
		},
		-- color picker
		{
			"nvzone/minty",
			cmd = { "Shades", "Huefy" },
		},
	},
	-- luasnip ui
	{
		"chrisgrieser/nvim-scissors",
		event = "BufReadPre",
		lazy = true,
		opts = {
			snippetDir = vim.fn.stdpath("config") .. "/snippets",
		},
	},
	-- compiler
	{
		{ -- This plugin
			"Zeioth/compiler.nvim",
			lazy = true,
			cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
			dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
			opts = {},
		},
		{ -- The task runner we use
			"stevearc/overseer.nvim",
			lazy = true,
			commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
			cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
			opts = {
				task_list = {
					direction = "bottom",
					min_height = 25,
					max_height = 25,
					default_detail = 1,
				},
			},
		},
	},
	-- hightlight comments
	{
		"folke/todo-comments.nvim",
		lazy = true,
		-- enabled = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "glitch", "fix", "fixme", "bug", "issue" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info", alt = { "TODO", "task", "todo", "TASK" } },
				HACK = { icon = " ", color = "hint", alt = { "HACK", "HACKING", "hack", "hacking" } },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "warn" } },
				PERF = {
					icon = " ",
					alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "optim", "performance", "optimize", "perf" },
				},
				NOTE = { icon = " ", color = "hint", alt = { "INFO", "info", "note", "hint", "HINT" } },
				TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				PENCIL = { icon = "󰏪 ", color = "pen", alt = { "PENCIL", "PEN", "pen", "pencil" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			-- list of named colors where we try to extract the guifg from the
			-- list of highlight groups or use the hex color if hl not found as a fallback
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
				pen = { "Info", "#5bf502" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			}, -- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- bigfile
	{
		"LunarVim/bigfile.nvim",
		lazy = true,
		event = "BufReadPre",
		opts = {
			filesize = 3, -- size of the file in MiB, the plugin round file sizes to the closest MiB
		},
		config = function(_, opts)
			require("bigfile").setup(opts)
		end,
	},
	-- barbecue
	{
		"utilyre/barbecue.nvim",
		lazy = true,
		event = { "LspAttach", "VeryLazy", "BufRead", "BufWrite" },
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {},
	},
	-- colorify modificator
	{
		"mawkler/modicator.nvim",
		lazy = true,
		event = { "BufRead", "BufWrite" },
		-- dependencies = 'mawkler/onedark.nvim', -- Add your colorscheme plugin here
		init = function()
			-- These are required for Modicator to work
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		opts = {
			-- Warn if any required option above is missing. May emit false positives
			-- if some other plugin modifies them, which in that case you can just
			-- ignore. Feel free to remove this line after you've gotten Modicator to
			-- work properly.
			show_warnings = false,
			integration = {
				lualine = {
					enabled = true,
					-- Letter of lualine section to use (if `nil`, gets detected automatically)
					mode_section = nil,
					-- Whether to use lualine's mode highlight's foreground or background
					highlight = "bg",
				},
			},
		},
	},
	-- show keystroke
	{
		"nvzone/showkeys",
		lazy = true,
		cmd = "ShowkeysToggle",
		opts = {
			timeout = 1,
			maxkeys = 5,
			position = "top-center",
		},
	},
	-- better neovim notification
	{
		"rcarriga/nvim-notify",
		lazy = true,
		config = function()
			require("userConfigs.notify")
		end,
	},
	-- outline code map
	-- {
	-- 	"hedyhli/outline.nvim",
	-- 	-- lazy = true,
	-- 	event = { "LspAttach", "VeryLazy" },
	-- 	cmd = { "Outline", "OutlineOpen" },
	-- 	keys = { -- Example mapping to toggle outline
	-- 		{ "<S-o>", "<cmd>Outline<CR>", desc = "Toggle outline map" },
	-- 		opts = function()
	-- 			require("userConfigs.outline")
	-- 		end,
	-- 	},
	-- },
	-- session manager
	{
		"folke/persistence.nvim",
		-- lazy = true,
		opts = {},
	},
	-- notice
	{
		"folke/noice.nvim",
		-- enabled = false,
		lazy = true,
		-- enabled = use_noice,
		dependencies = {
			{ "MunifTanjim/nui.nvim", enabled = true }, --use_noice },
			{ "rcarriga/nvim-notify", enabled = true },
		},
		event = "BufWinEnter",
		opts = {
			messages = {
				enabled = true,
			},
			notify = {
				enabled = true,
			},
			lsp = {
				progress = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 1, 2 },
					},
					-- position = {
					--     row = 10,
					--     col = "55%",
					-- },
					-- size = {
					--     width = 60,
					--     height = "auto",
					-- },
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
		},
	},
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		enabled = true,
		version = "*",
		config = function()
			return require("userConfigs.term")
		end,
	},
	-- snippet support
	{
		"L3MON4D3/LuaSnip",
		config = function()
			local snipPath = vim.fn.stdpath("config") .. "/snippets"
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { snipPath } })
		end,
	},

	-- lsp hint
	{
		"ray-x/lsp_signature.nvim",
		event = { "InsertEnter", "LspAttach" },
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
		-- or use config
		-- config = function(_, opts) require'lsp_signature'.setup({you options}) end
	},
	-- advanced git search
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		dependencies = {
			--- See dependencies

			"tpope/vim-rhubarb",

			"sindrets/diffview.nvim",
		},
	},
	-- search repo
	{
		"cljoly/telescope-repo.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	},
	-- smart split
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		config = function()
			require("userConfigs.edgy")
		end,
	},
	-- better lsp diagnostic
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = { "VeryLazy", "LspAttach" }, -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			local tiny = require("userConfigs.inline-diagnostic")
			local diagnostic = require("tiny-inline-diagnostic")
			diagnostic.setup(tiny)
		end,
	},
	-- spell check
	{
		"ravibrock/spellwarn.nvim",
		event = "VeryLazy",
		config = function()
			require("userConfigs.spell")
		end,
	},
	-- ultimate nvim pairs
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		-- branch = 'v0.6', --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},
	-- inactive lsp when lost focus
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			-- your options here
		},
	},
	-- live preview
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"nvim-telescope/telescope.nvim",
			-- 'ibhagwan/fzf-lua',
			-- -- 'echasnovski/mini.pick',
		},
	},
	-- number line toggler
	-- {
	--     "cpea2506/relative-toggle.nvim",
	--     config = function ()
	--         require("relative-toggle").setup({
	--             pattern = "*",
	--             events = {
	--                 on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
	--                 off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
	--             },
	--         })

	--     end
	-- }
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("userConfigs.color_hl")
		end,
	},
}
