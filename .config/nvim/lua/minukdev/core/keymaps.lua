-- vim.g.mapleader = " "
local keymap = vim.keymap

-- tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffer
keymap.set("n", "\\n", "<cmd>bn<CR>", { desc = "move next buffer" })
keymap.set("n", "\\x", "<cmd>bn<CR>", { desc = "move next buffer" })
keymap.set("n", "\\p", "<cmd>bp<CR>", { desc = "move prev buffer" })
keymap.set("n", "\\z", "<cmd>bp<CR>", { desc = "move prev buffer" })
