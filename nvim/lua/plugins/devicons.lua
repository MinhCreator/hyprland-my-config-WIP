return {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = function ()
        require "userConfigs.override-devicon"
    end
}
