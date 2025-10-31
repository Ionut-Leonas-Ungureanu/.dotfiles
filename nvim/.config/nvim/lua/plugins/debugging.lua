return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

		local netcoredbg_adapter = {
			type = "executable",
			command = mason_path,
			args = { "--interpreter=vscode" },
		}

		dap.adapters.netcoredbg = netcoredbg_adapter
		dap.adapters.coreclr = netcoredbg_adapter

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					-- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
					vim.cmd("!dotnet build")
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net8.0/", "file")
				end,
			},
		}

		dapui.setup({
			expand_lines = true,
			controls = { enabled = false }, -- no extra play/step buttons
			floating = { border = "rounded" },
			-- Set dapui window
			render = {
				max_type_length = 60,
				max_value_lines = 200,
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.5 },
						{ id = "repl", size = 0.5 },
					},
					size = 15,
					position = "bottom",
				},
			},
		})

		-- dapui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dap.repl.close()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dap.repl.close()
			dapui.close()
		end

		-- dap shortcuts
		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dq", function()
			require("dap").terminate()
			require("dapui").close()
		end)
	end,
}
