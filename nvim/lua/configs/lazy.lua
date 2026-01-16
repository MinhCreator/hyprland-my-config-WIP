vim.g.mapleader = " "
--setup base46 theme
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.maplocalleader = "\\"
local imp = {{import = "plugins"}}

-- Setup lazy.nvim
require("lazy").setup(imp, require "configs.lazy_config")
-- load theme
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "treesitter")

-- load essential module
-- require "nvchad.autocmds"
require "options"
require "autocmds"
require "configs.neovide"
require "keyBinding"
require "custom-cmd"
