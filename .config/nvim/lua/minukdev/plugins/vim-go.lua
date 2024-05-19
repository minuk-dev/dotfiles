return {
	"fatih/vim-go",
	config = function()
		local keymap = vim.keymap

		-- if filetype is not go, do nothing
		if vim.bo.filetype ~= "go" then
			return
		end

		-- only telescope's indexing.
		keymap.set("n", "<leader>goimplement", "<cmd>GoImpl<cr>", { desc = "Go - Implement interface" })
		keymap.set("n", "<leader>godoc", "<cmd>GoDoc<cr>", { desc = "Go - Show documentation" })
		keymap.set("n", "<leader>gotest", "<cmd>GoTest<cr>", { desc = "Go - Show documentation" })
		keymap.set("n", "<leader>gotestfunc", "<cmd>GoTestFunc<cr>", { desc = "Go - Show documentation" })
		keymap.set("n", "<leader>gocoverage", "<cmd>GoCoverage<cr>", { desc = "Go - Show documentation" })
		keymap.set("n", "<leader>gorename", "<cmd>GoRename<cr>", { desc = "Go - Rename" })
	end,
}
