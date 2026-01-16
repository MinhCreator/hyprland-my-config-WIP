local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
return {
    'nvim-tree/nvim-tree.lua',
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function ()
        require "userConfigs.nvim-tree"
    end

}