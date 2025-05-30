return {
  "lewis6991/gitsigns.nvim",

  config = function ()
    require('gitsigns').setup({

    })

    local gs = require('gitsigns')

    -- Core actions
    vim.keymap.set('n', '<leader>gl', gs.toggle_current_line_blame, { desc = 'Toggle Git Line Blame' })
    vim.keymap.set('n', '<leader>gd', gs.diffthis, { desc = 'View Git Diff of Hunk' })
    vim.keymap.set('n', '<leader>gp', gs.preview_hunk_inline, { desc = 'Preview Git Hunk Inline' })
    vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage Git Hunk' })
    vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage Entire Buffer' })
    vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset Git Hunk' })
    vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset Entire Git Buffer' })
    vim.keymap.set('n', '<leader>gU', gs.reset_buffer_index, { desc = 'Unstage Entire Buffer' })

    -- Navigation
    vim.keymap.set('n', ']g', function() gs.nav_hunk('next') end, { desc = 'Next Git Hunk' })
    vim.keymap.set('n', '[g', function() gs.nav_hunk('prev') end, { desc = 'Previous Git Hunk' })

    -- Visual selections
    vim.keymap.set('v', '<leader>gs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Stage Selected Git Hunk' })

    vim.keymap.set('v', '<leader>gr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Reset Selected Git Hunk' })

    -- Hunk text object (for operator-pending mode, like `dih`, `vih`)
    vim.keymap.set({'o', 'x'}, 'gh', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Git Hunk' })

    -- Optional: Git log via telescope if installed
    vim.keymap.set('n', '<leader>gt', '<cmd>Telescope git_commits<cr>', { desc = 'Git Log' })
  end
}
