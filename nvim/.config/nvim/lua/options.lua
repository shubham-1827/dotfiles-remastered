-- Core editor settings
local o = vim.o
local wo = vim.wo
local cmd = vim.cmd

-- UI
o.termguicolors = true -- true color support
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

o.number = true         -- absolute line numbers
o.relativenumber = true -- relative line numbers
wo.cursorline = true    -- highlight current line
-- wo.cursorcolumn = true                  -- highlight current column

-- Indentation
o.expandtab = true -- use spaces instead of tabs
o.shiftwidth = 2   -- size of an indent
o.tabstop = 2      -- number of spaces tabs count for
o.softtabstop = 2  -- "soft" tab stops

-- Searching
o.ignorecase = true -- case-insensitive search
o.smartcase = true  -- but case-sensitive if uppercase
o.hlsearch = true   -- highlight search matches
o.incsearch = true  -- incremental search

-- Splits & Windows
o.splitbelow = true   -- horizontal splits go below
o.splitright = true   -- vertical splits go right
wo.signcolumn = "yes" -- always show sign column

-- Scrolling & context
o.scrolloff = 8     -- lines to keep above/below cursor (optional if you want more context)
o.sidescrolloff = 8 -- columns to keep left/right of cursor (optional if you want more context)

-- Editor behavior
o.wrap = true      -- disable line wrap
o.linebreak = true -- wrap at word boundary

-- Files & backups
o.undofile = true   -- persistent undo
o.undolevels = 1000 -- high undo levels
o.hidden = true     -- allow background buffers

-- Completion
o.completeopt = "noinsert,noselect" -- to disable nvim default autocomplete, it you are using cmp

-- Timeouts & responsiveness
o.updatetime = 300 -- faster CursorHold
o.timeoutlen = 400 -- reduce mapping timeout

-- Clipboard (native Linux)
o.clipboard = "unnamedplus" -- use system clipboard

-- Mouse & GUI
o.mouse = "a" -- enable mouse in all modes

-- Autocommands
-- remove comment continuation
cmd([[autocmd FileType * setlocal formatoptions-=cro]])
-- highlight on yank
do
  local yank_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_grp,
    callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
  })
end

-- clear trailing whitespace except markdown
cmd([[autocmd BufWritePre * if &filetype !=# 'markdown' | %s/\s\+$//e | endif]])

-- disable cursorline/column in inactive windows
do
  local win_sep = vim.api.nvim_create_augroup("CursorLineToggle", { clear = true })
  vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "FocusGained" }, {
    group = win_sep,
    callback = function()
      vim.wo.cursorline = true
    end,
  })
  vim.api.nvim_create_autocmd({ "WinLeave", "BufWinLeave", "FocusLost" }, {
    group = win_sep,
    callback = function()
      vim.wo.cursorline = false
    end,
  })
end

-- Matched pairs
o.matchpairs = o.matchpairs .. ",<:>" -- include angle brackets

-- Optional: nicer wildmenu completion
o.wildmenu = true -- enhanced command-line completion

-- better diffs
vim.opt.diffopt:append({
  "filler",            -- Add filler lines to keep diffs aligned
  "internal",          -- Use Neovim's internal diff engine
  "algorithm:patience", -- Use "patience" algorithm (better for complex diffs)
  "indent-heuristic",  -- Smarter handling of diffs based on indentation
  "linematch:60",      -- Smarter line matching for changed blocks
})

-- Persist cursorline on pretty much any UI/window change
local g = vim.api.nvim_create_augroup("PersistentCursorline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "BufEnter", "WinScrolled", "ModeChanged", "FocusGained" }, {
  group = g,
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

-- turn off cursorline automatically when you leave focus or buffer
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "FocusLost" }, {
  group = g,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- Function to decide whether to indent then enter insert, or just insert
local function indent_with_i()
  -- Get the current line’s text
  local line = vim.fn.getline(".")
  -- If it’s completely empty...
  if #line == 0 then
    --its the cc trick to indent the cursor to correct position
    return '"_cc'
  else
    -- else just do a normal insert
    return "i"
  end
end

-- Map `i` in normal mode, using the above function as an expression
vim.keymap.set("n", "i", indent_with_i, { expr = true, noremap = true })

-- same thing for 'a' as we have done for 'i'
local function indent_with_a()
  local line = vim.fn.getline(".")
  if #line == 0 then
    return '"_cc'
  else
    return "a"
  end
end

vim.keymap.set("n", "a", indent_with_a, { expr = true, noremap = true })

-- to automatically sync the changes with the jupyter notebook in the browser
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.py", "*.ipynb" },
  command = "silent! !jupytext --sync %",
})
