-- this feature is not working yet I may Tries to fix it later
return {
	{
		"mfussenegger/nvim-dap",
		enabled = false,
		event = { "BufRead", "BufWrite" },
		dependencies = {
			{ "rcarriga/nvim-dap-ui", enabled = false },
			{ "nvim-neotest/nvim-nio", enabled = false },
			{ "jay-babu/mason-nvim-dap.nvim", enabled = false },
		},
		config = function()
			local map = vim.keymap.set
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			map("n", "dc", dap.continue(), { desc = "dap continue" })
			map("n", "dt", dap.toggle_breakpoint(), { desc = "toggle breakpoint" })
		end,
	},
}
