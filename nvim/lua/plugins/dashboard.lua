return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	-- enabled = true,
	init = false,
	config = function(_)
		local dashboard = require("userConfigs.dash")
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end
		-- hidden cursor
		-- vim.api.nvim_create_autocmd('User', {
		--     pattern = 'AlphaReady',
		--     desc = 'hide cursor for alpha',
		--     callback = function()
		--         local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
		--         hl.blend = 100
		--         vim.api.nvim_set_hl(0, 'Cursor', hl)
		--         vim.opt.guicursor:append('a:Cursor/lCursor')
		--     end,
		-- })
		vim.api.nvim_create_autocmd("BufUnload", {
			buffer = 0,
			desc = "show cursor after alpha",
			callback = function()
				local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
				hl.blend = 0
				vim.api.nvim_set_hl(0, "Cursor", hl)
				vim.opt.guicursor:remove("a:Cursor/lCursor")
			end,
		})

		require("alpha").setup(dashboard.opts)

		--vim.api.nvim_create_autocmd("User", {
		--  once = true,
		--  pattern = "LazyVimStarted",
		--  callback = function()
		--    local stats = require("lazy").stats()
		--    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		--    dashboard.section.footer.val = "⚡ Lazy neovim loaded "
		--      .. stats.loaded
		--      .. "/"
		--      .. stats.count
		--      .. " plugins in "
		--      .. ms
		--      .. "ms"
		--    pcall(vim.cmd.AlphaRedraw)
		--  end,
		--})
	end,
}
