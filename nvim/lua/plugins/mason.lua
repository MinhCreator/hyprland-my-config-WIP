return {
  {
    "williamboman/mason.nvim",
    -- lazy = true,
    event = "VeryLazy",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },

  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      require "userConfigs.lspconfig"
    end,
  },

}
