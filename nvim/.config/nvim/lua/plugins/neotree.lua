return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require 'window-picker'.setup({
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', "quickfix" },
            },
          },
        })
      end,
    },
  },
  config = function ()

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError",
      {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
      {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
      {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
      {text = "󰌵", texthl = "DiagnosticSignHint"})
    --
    -- Create an autocommand group
    vim.api.nvim_create_augroup('NeoTreeEvents', { clear = true })

    -- Autocommand to set relative number when entering a neo-tree buffer
    vim.api.nvim_create_autocmd('BufEnter', {
      group = 'NeoTreeEvents',
      pattern = 'neo-tree*', -- Apply to neo-tree buffers
      callback = function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd('setlocal relativenumber')
          vim.cmd('setlocal number')
        end
      end,
      require("neo-tree").setup(),

      vim.keymap.set('n', '<leader>nt', ':Neotree toggle<CR>', { noremap = true, silent = true })

    })

  end

}
