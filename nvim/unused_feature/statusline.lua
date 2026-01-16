local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.green },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.dark_grey },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.yellow } },
    replace = { a = { fg = colors.black, bg = colors.dark_red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
    },
    winbar = {
        -- z = { fg = colors.blue, bg = nil },
    },
}
local icons = require("userConfigs.icons")
-- local i = icons

local icon_mode = {
    "mode",
    right_padding = 5,
    -- separator = {
    -- left = "",
    -- right = "",
    -- },
    -- right_padding = 3,
    fmt = function(str)
        local Nvim_mode = vim.api.nvim_get_mode()["mode"]
        if Nvim_mode == "n" then
            return icons.ui.Vim .. " " .. str
        elseif Nvim_mode == "i" then
            return icons.ui.Edit .. " " .. str
        elseif Nvim_mode == "v" then
            return icons.ui.Visual .. " " .. str
        elseif Nvim_mode == "R" then
            return icons.ui.Replace .. " " .. str
        end
        return icons.ui.Neovim .. " " .. str
    end,
}

local short_mode = {
    "mode",
    right_padding = 2,
    -- separator = {
    -- left = "",
    -- right = "",
    -- },
    -- right_padding = 3,
    fmt = function(str)
        local Nvim_Mode = vim.api.nvim_get_mode()["mode"]
        if Nvim_Mode == "n" then
            return "N"
        elseif Nvim_Mode == "i" then
            return "I"
        elseif Nvim_Mode == "v" then
            return "V"
        elseif Nvim_Mode == "R" then
            return "R"
        elseif Nvim_Mode == "t" then
            return "T"
        elseif Nvim_Mode == "c" then
            return "Cmd"
        end
        -- return icons.ui.Neovim .. " " .. str
        return "null"
    end,
}
