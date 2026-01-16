-- require "nvchad.mappings"
--
-- -- add yours here
-- local builtin = require("telescope.builtin")
local map = vim.keymap.set

---@param noremapbool boolean
---@param silentbool boolean
---@param desc string
---@return table
local opts = function(noremapbool, silentbool, desc)
	return { noremap = noremapbool, silent = silentbool, desc = desc }
end
-- go to line
map({ "n", "v" }, "<space>g", "<cmd>Gline<cr>", { desc = "Go to line" })

map("n", ";", ":", { desc = "Enter CMD mode" })
map("i", "jk", "<ESC>")
map("n", "p", "<cmd>:echo expand('%:p')<cr>", opts(true, true, "Show file path"))

map("n", "w", "<cmd>w<CR>", { desc = "save file" })

map("n", "<C-t>", function()
	require("minty.huefy").open() -- open("default")
end, opts(true, true, "colors picker"))

map("n", "<C-m>", "<cmd>nohlsearch<cr>")
-- right click menu
-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
	require("menu.utils").delete_old_menus()

	vim.cmd.exec('"normal! \\<RightMouse>"')

	-- clicked buf
	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

	require("menu").open(options, { mouse = true })
end, {})

-- map("n", "<leader>fc", function()
--     -- Use Telescope to find files in the Neovim config directory
--     builtin.find_files({
--         cwd = vim.fn.stdpath("config"),
--         prompt_title = "Neovim Config Files"
--     })
-- end, { desc = "Find files in Neovim config" })
-- map("n", "<space>n", ":Telescope resume<cr>", { noremap = true, desc = "Resume last action", silent = true })
-- map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope binding
map("n", "<leader>t", "", { desc = "telescope" })
map("n", "<leader>tg", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>ts", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>th", function()
	require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- toggle number line
map("n", "<leader><S-n>", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader><S-r>", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- toggle home screen
map("n", "<c-a>", "<cmd>Alpha<cr>", opts(true, true, "Toggle home screen"))

map({ "n", "v" }, "<C-z>", "<cmd>undo<cr>", opts(true, true, "Undo"))
map({ "n", "v" }, "<C-y>", "<cmd>redo<cr>", opts(true, true, "Redo"))

map({ "n", "v" }, "<C-c>", "<cmd>%y+<CR>", opts(true, false, "Copy to clipboard"))
map({ "n", "v" }, "<C-v>", '"+p', opts(true, false, "Paste from clipboard"))
map({ "n", "v" }, "<C-x>", '"+x', opts(true, false, "Cut to clipboard"))

map("n", "<C-p>", "<cmd>lua print(vim.bo.filetype)<cr>", opts(true, true, "Print filetype"))

-- Open compiler
map("n", "<F6>", "<cmd>CompilerOpen<cr>", opts(true, true, "Open compiler"))

-- Redo last selected option
map(
	"n",
	"<S-F6>",
	"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
		.. "<cmd>CompilerRedo<cr>",
	opts(true, true, "Redo last selected option")
)

-- Toggle compiler results
map("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", opts(true, true, "Toggle compiler results"))

--Toggle buffers
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts(true, true, "Next tab"))
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts(true, true, "Previous tab"))

map("n", "<leader>bd", "<cmd>bd!<cr>", opts(true, true, "Close buffer"))
-- toggle luasnip ui
map("n", "<leader>a", "", opts(true, true, "Toggle luasnip ui"))
map("n", "<leader>ae", function()
	require("scissors").editSnippet()
end, opts(false, true, "Snippet: Edit"))

-- when used in visual mode, prefills the selection as snippet body
map({ "n", "x" }, "<leader>aa", function()
	require("scissors").addNewSnippet()
end, opts(true, true, "Snippet: Add"))

-- move lines up and down in visual mode
map("v", "J", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up" })
map("v", "K", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down" })

-- new terminals
-- map("n", "<leader>h", function()
-- 	require("nvchad.term").new({ pos = "sp" })
-- end, { desc = "terminal new horizontal term" })

-- map("n", "<leader>v", function()
-- 	require("nvchad.term").new({ pos = "vsp" })
-- end, { desc = "terminal new vertical term" })

-- map("n", "<leader>f", function()
-- 	require("nvchad.term").new({ pos = "float", size = 10 })
-- end, { desc = " terminal new float term" })

-- -- toggleable
-- map({ "n", "t" }, "<A-v>", function()
-- 	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
-- end, { desc = "terminal toggleable vertical term" })

-- map({ "n", "t" }, "<A-h>", function()
-- 	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
-- end, { desc = "terminal toggleable horizontal term" })

-- map({ "n", "t" }, "<A-i>", function()
-- 	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
-- end, { desc = "terminal toggle floating term" })
