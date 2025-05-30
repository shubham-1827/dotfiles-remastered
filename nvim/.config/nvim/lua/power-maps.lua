-- Custom Commands
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Better than pressing ESC i guess" })

-- adding new lines below and above the cursor without moving the cursor
vim.keymap.set("n", "<leader>o", "o<ESC>", { desc = "add new line below cursor" })

vim.keymap.set("n", "<leader>O", "O<ESC>", { desc = "add new line above cursor" })

--really needed ones , just try then you know
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wqall", "wqall", {})

-- Remap Ctrl-h, Ctrl-j, Ctrl-k, Ctrl-l for navigation in insert mode with descriptions
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left in insert mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down in insert mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right in insert mode" })

-- vs code like alt + j, k to move line up and down in normal
vim.keymap.set("n", "J", ":m .+1<CR>==", { desc = "Move text down" })
vim.keymap.set("n", "K", ":m .-2<CR>==", { desc = "Move text up" })
-- Move selected blocks down/up in visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Visual: move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Visual: move block up" })

-- -- Join line without moving cursor
-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Normal: join line below and restore cursor" })

-- Scroll half-pages and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Normal: half-page down + center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Normal: half-page up + center" })

-- Keep search results centered and open folds
vim.keymap.set("n", "n", "nzzzv", { desc = "Normal: next search result + center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Normal: previous search result + center" })

-- Re-indent current paragraph without losing cursor
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Normal: reindent paragraph, restore cursor" })

-- Restart LSP server
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>", { desc = "LSP: restart server" })

-- Paste over selection without yanking it
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Visual: paste over selection without yank" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete without affecting registers
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to black hole register" })

-- Search & replace word under cursor, case-insensitive
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search/Replace: word under cursor" }
)

-- search and replace a particular word in the selected region
vim.keymap.set("n", "<leader>vs", function()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local start_line = start_pos[2]
	local end_line = end_pos[2]
	local from = vim.fn.input("Replace word: ")
	if from == "" then
		return
	end

	local to = vim.fn.input("With: ")

	from = vim.fn.escape(from, [[/\]])
	to = vim.fn.escape(to, [[/\]])

	local cmd = string.format(":%d,%ds/\\<%s\\>/%s/g", start_line, end_line, from, to)
	vim.cmd(cmd)
end, { desc = "Replace word in visual selection" })

-- Make file executable
vim.keymap.set(
	"n",
	"<leader>ex",
	"<cmd>!chmod +x %<CR>",
	{ silent = true, desc = "Utility: make current file executable" }
)
