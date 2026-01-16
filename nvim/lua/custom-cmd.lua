local quit_search = function()
	vim.cmd("nohlsearch")
end
-- quit_search
vim.api.nvim_create_user_command("Qsearch", quit_search, {})

-- toggle notification
local toggle_notify = function()
	vim.cmd("Telescope notify")
end
-- toggle_notify
vim.api.nvim_create_user_command("Tnotify", toggle_notify, {})

-- toggle spellwarn
vim.api.nvim_create_user_command("Tspell", function()
	require("spellwarn").toggle()
end, {})

-- add go to line
local go_to_line = function()
	local line = vim.fn.input("Go to: " .. "line ".. vim.fn.line("w0") .. " to max line " .. vim.fn.line("$"))
	if tonumber(line) then
		-- vim.cmd("normal! " .. line .. "G")
		vim.cmd(line)
	else
		vim.notify("Invalid line number", "warn", {
			title = "Go to Line" ,
		})
	end
end

vim.api.nvim_create_user_command("Gline", go_to_line, {
	nargs = 0,
	desc = "Go to a specific line in the current buffer",
})
