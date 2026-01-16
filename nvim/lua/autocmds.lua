-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--vim.cmd("TwilightEnable")
-- vim.cmd("set clipboard=unnamed")
vim.cmd(": set cmdheight=0")
vim.cmd(":set autochdir")
local stats = require("lazy").stats()
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
local msg = "⚡ Plugins loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"

-- add startup notify
-- vim.notify(msg, "warn", { title = " Plugins Manager " })
vim.fn.timer_start(math.floor(ms), function()
	vim.notify(" Welcome to Neovim", "info", { title = "Neovim IDE" })
	vim.fn.timer_start(math.floor(ms), function()
		vim.notify(" Happy coding!", "info", { title = "Neovim IDE" })
	end)
end)
--
-- local api = vim.api

-- local show_keys = vim.api.nvim_create_augroup("show_keys", { clear = true })
-- local bool = vim.bo.filetype
-- api.nvim_create_autocmd({ "BufReadPre" }, {
--     pattern = "*",
--     group = show_keys,
--     callback = function()
--         if bool == "alpha" then
--             return
--         else
--             return vim.cmd(": ShowkeysToggle")
--         end
--     end

-- })

-- local autofocus = vim.api.nvim_create_augroup("autofocus", { clear = true })
-- api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufReadPost" }, {
--     pattern = "*",
--     group = autofocus,
--     callback = function()
--         return vim.cmd(": TwilightEnable")
--     end
-- })

-- api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
--     pattern = "*",
--     group = autofocus,
--     callback = function()
--         return vim.cmd(": TwilightDisable")
--     end
-- })

-- auto move {HomeDir}
-- vim.cmd(": cd ~/ ")

-- local relative_number = vim.api.nvim_create_augroup("relative_number", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertEnter", "WinEnter", "CmdlineLeave", "InsertLeave" }, {
--     pattern = "*",
--     group = relative_number,
--     callback = function()
--         if vim.bo.filetype ~= "alpha" then
--             vim.cmd("set nu!")
--         end
--     end
-- })
-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave", "CmdlineEnter" }, {
--     pattern = "*",
--     group = relative_number,
--     callback = function()
--         vim.cmd("set nonumber!")
--     end
-- })
