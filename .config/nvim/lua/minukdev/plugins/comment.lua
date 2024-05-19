return {
	"echasnovski/mini.comment",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	options = {
		mappings = {
			comment = "gcc",
			comment_line = "gcc",
			comment_block = "gcb",
			comment_visual = "gcc",
			textobject = "gcc",
		},
	},
	config = function() end,
}
