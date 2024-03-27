return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",

		-- for golang
		"leoluz/nvim-dap-go",

		-- for c++
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({})

		dap.configurations.go = {
			require("dap-go").setup({}),
		}

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = true,
			},
		}

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

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dg", dap.continue, {})
        vim.keymap.set("n", "<leader>di", dap.step_into, {})
        vim.keymap.set("n", "<leader>do", dap.step_over, {})
	end,
}
