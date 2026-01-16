---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.term = {
--     winopts = { number = false },
--     sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
--     float = {
--         row = 0.3, col = 0.25,
--         width = 0.5,
--         height = 0.4,
--         border = "single",
--     },
-- }
M.cheatsheet = {
	theme = "grid",
}

M.ui = {

	-- cmp = {
	-- 	-- -- icons_left = false, -- only for non-atom styles!
	-- 	-- style = "default", -- default/flat_light/flat_dark/atom/atom_colored
	-- 	-- abbr_maxwidth = 60,
	-- 	format_colors = {
	-- 		tailwind = true, -- will work for css lsp too
	-- 		icon = "󱓻",
	-- 	},
	-- 	border_style = "rounded",
	-- },
	tabufline = {
		enabled = false,
	},
	-- lsp = { signature = true },
	statusline = {
		enabled = false,
	},
}
M.colorify = {
	enabled = false,
}

return M
