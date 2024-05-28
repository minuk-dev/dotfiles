return {
	"voldikss/vim-floaterm",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>gg", "<cmd>FloatermNew --height=0.8 --width=0.8 tig<CR>", { desc = "tig" })
	end,
}
