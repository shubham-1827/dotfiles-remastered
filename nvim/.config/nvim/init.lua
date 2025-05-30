require("options")
require("config.lazy")
-- require("config.lsp-config")
require("config.diagnostics")
require("power-maps")

vim.cmd("colorscheme tokyonight-night")

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
