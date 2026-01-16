local icons = require "configs.icon"
return {
    install = { colorscheme = { "onedark" } },
    defaults = {},
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "lazyredraw",
            },
        },
    },
    ui = {
        icons = {
            ft = icons.ft,           --"",
            lazy = icons.Bell,       --"󰂠 ",
            loaded = icons.CheckCircle, --"",
            not_loaded = icons.not_loaded, --"",
        },
        border = "rounded",
        --backdrop = 100,
        -- backdrop = 190,
    },
    checker = { enabled = false, notify = true },
    change_detection = { enabled = true },
}