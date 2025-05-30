return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lua",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    -- load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    -- your custom snippets
    require("snippets.cpp_snippets")

    lspkind.init({ symbol_map = { Codeium = "" } })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = {
        -- snippet jumps
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- completion navigation
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- scroll up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- scroll down

        -- confirm with Enter
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "codeium" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),

      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- buffer source in search (`/`)
    cmp.setup.cmdline("/", {
      mapping = {
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
      },
      sources = { { name = "buffer" } },
    })

    -- path & cmdline source in command mode (`:`)
    cmp.setup.cmdline(":", {
      mapping = {
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
      },
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })
  end,
}
