return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		-- 🔥 Trouble Main Toggles
		{ "<leader>tt", "<cmd>Trouble<cr>", desc = "Trouble: Toggle Trouble" },
		{ "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: Workspace Diagnostics" },
		{ "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble: Buffer Diagnostics" },

		-- 🔥 LSP
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "Trouble: LSP (All Definitions/Refs/Implementations)",
		},
		{
			"<leader>ts",
			"<cmd>Trouble lsp_document_symbols toggle focus=false<cr>",
			desc = "Trouble: Document Symbols (Outline)",
		},
		{ "<leader>ti", "<cmd>Trouble lsp_incoming_calls toggle<cr>", desc = "Trouble: LSP Incoming Calls" },
		{ "<leader>to", "<cmd>Trouble lsp_outgoing_calls toggle<cr>", desc = "Trouble: LSP Outgoing Calls" },
		{ "<leader>tr", "<cmd>Trouble lsp_references toggle<cr>", desc = "Trouble: LSP References" },

		-- 🔥 LSP direct jumps
		{ "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "Trouble: Go to Definitions" },
		{ "gD", "<cmd>Trouble lsp_declarations<cr>", desc = "Trouble: Go to Declarations" },
		{ "gi", "<cmd>Trouble lsp_implementations<cr>", desc = "Trouble: Go to Implementations" },
		{ "gt", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Trouble: Go to Type Definitions" },

		-- 🔥 Lists
		{ "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble: Location List" },
		{ "<leader>tq", "<cmd>Trouble quickfix toggle<cr>", desc = "Trouble: Quickfix List" },

		-- 🔥 Diagnostics Navigation
		-- Next Diagnostic Safe
		{
			"]d",
			function()
				local trouble = require("trouble")
				if trouble.is_open() then
				-- trouble.view():next({ skip_groups = true, jump = true })
				else
					vim.diagnostic.jump({ count = 1, wrap = true, float = true })
				end
			end,
			mode = "n",
			desc = "Trouble: Next Diagnostic (safe)",
		},

		-- Previous Diagnostic Safe
		{
			"[d",
			function()
				local trouble = require("trouble")
				if trouble.is_open() then
					trouble.view():previous({ skip_groups = true, jump = true })
				else
					vim.diagnostic.jump({ count = -1, wrap = true, float = true })
				end
			end,
			mode = "n",
			desc = "Trouble: Previous Diagnostic (safe)",
		},
	},
}
