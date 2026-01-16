
local powershell_options = {
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}

-- for option, value in pairs(powershell_options) do
    -- vim.opt[option] = value
-- end
local Terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
    local float = Terminal:new({ direction = "float" })
    return float:toggle()
end
local toggle_lazygit = function()
    local lazygit = Terminal:new({ cmd = "Lazygit", direction = "float" })
    return lazygit:toggle()
end

local toggle_horizontal = function()
    local horizontal = Terminal:new({ direction = "horizontal" })
    return horizontal:toggle()
end

local toggle_tab = function()
    local tab = Terminal:new({ direction = "tab" })
    return tab:toggle()
end

local toggle_vertical = function()
    local vertical = Terminal:new({ direction = "vertical" })
    return vertical:toggle()
end

require("toggleterm").setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    mappings = {

        vim.keymap.set("n", "<leader>c", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true, desc = " ToggleTerm" }),
        vim.keymap.set("n", "<leader>cf", toggle_float, { noremap = true, silent = true, desc = "ToggleFloat" }),

        -- vim.keymap.set("n", "<leader>tl", toggle_lazygit, { noremap = true, silent = true, desc = "ToggleLazyGit" }),

        vim.keymap.set("n", "<leader>ch", toggle_horizontal, { noremap = true, silent = true, desc = "ToggleHorizontal" }),
        vim.keymap.set("n", "<leader>ct", toggle_tab, { noremap = true, silent = true, desc = "ToggleTab" }),

        vim.keymap.set("n", "<leader>cv", toggle_vertical, { noremap = true, silent = true, desc = "ToggleVertical" }),
    },

    hide_numbers = true,    -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = true,       -- when neovim changes it current directory the terminal will change it's own when next it's opened

    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true,    -- if set to true (default) the previous terminal mode will be remembered
    close_on_exit = true,   -- close the terminal window when the process exits
    clear_env = false,      -- use only environmental variables from `env`, passed to jobstart()

    -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "curved", --'single' | 'double' | 'shadow' |  | ... other options supported by win open
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        -- width = <value>,
        -- height = <value>,
        -- row = <value>,
        -- col = <value>,
        -- winblend = 3,
        -- zindex = <value>,
        title_pos = "center", -- 'left' |  | 'right', position of the title of the floating window
    },
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end,
    },
})
