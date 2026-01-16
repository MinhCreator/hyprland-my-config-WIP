return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = {"BufRead", "BufWrite"},
    config = function ()
      require "userConfigs.git"
    end
}

