return {
	-- nvim-cmp and related plugins
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP completion source
		"hrsh7th/cmp-buffer", -- Buffer completion source
		"hrsh7th/cmp-path", -- Path completion source
		"hrsh7th/cmp-cmdline", -- Cmdline completion source
		"saadparwaiz1/cmp_luasnip", -- Snippet source for LuaSnip
		"L3MON4D3/LuaSnip", -- Snippet engine
		"rafamadriz/friendly-snippets", -- Predefined snippets
		"onsails/lspkind.nvim", -- lspkind for icons
		"hrsh7th/cmp-nvim-lua", -- for lua completions
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind") -- Optional, adds icons to completion items
		local snip_loader = require("luasnip.loaders.from_vscode")
		-- Load VSCode-style snippets from friendly-snippets
		require("luasnip")
		snip_loader.lazy_load()
		-- require("snippets.cpp_snippets")
		-- require("snippets.latex_snippets")

		-- for icon of codeium
		lspkind.init({
			symbol_map = { Codeium = "" },
		})

		cmp.setup({
			-- Specify completion sources
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP completion
				{ name = "luasnip" }, -- Snippets
				{ name = "nvim_lua" }, -- specially for lua
				{ name = "codeium" }, -- specially for codeium
				{ name = "buffer" }, -- Buffer words
				{ name = "path" }, -- File paths
			}),
			-- Mapping keys for completion
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item() -- Select the next item
					-- elseif require("luasnip").expand_or_jumpable() then
					--   require("luasnip").expand_or_jump() -- Snippet expansion or jump
					else
						fallback() -- Fallback to default behavior
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item() -- Select the previous item
					-- elseif require("luasnip").jumpable(-1) then
					--   require("luasnip").jump(-1) -- Jump backwards in snippet
					else
						fallback() -- Fallback to default behavior
					end
				end, { "i", "s" }),
				["<C-n>"] = cmp.mapping.select_next_item(), -- Next item
				["<C-p>"] = cmp.mapping.select_prev_item(), -- Previous item
				["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
				["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
				["<C-e>"] = cmp.mapping.close(), -- Close completion menu
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true }) -- Confirm completion
					else
						fallback() -- Insert newline
					end
				end, { "i", "s" }),
			}),
			-- Formatting options
			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- Expand snippets
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

		-- Setup for command-line completion
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline({
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
			}),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline({
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
			}),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
