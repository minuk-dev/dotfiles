return {
	"mhinz/vim-startify",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- returns all modified files of the current git repo
		-- `2>/dev/null` makes the command fail quietly, so that when we are not
		-- in a git repo, the list will be empty
		local function gitModified()
			local handle = io.popen("git ls-files -m 2>/dev/null")
			local result = handle:read("*a")
			handle:close()
			local files = {}
			for file in result:gmatch("[^\r\n]+") do
				table.insert(files, { line = file, path = file })
			end
			return files
		end

		-- same as above, but show untracked files, honouring .gitignore
		local function gitUntracked()
			local handle = io.popen("git ls-files -o --exclude-standard 2>/dev/null")
			local result = handle:read("*a")
			handle:close()
			local files = {}
			for file in result:gmatch("[^\r\n]+") do
				table.insert(files, { line = file, path = file })
			end
			return files
		end

		vim.g.startify_lists = {
			{ type = "sessions", header = { "   Sessions" } },
			{ type = "files", header = { "   MRU" } },
			{ type = "dir", header = { "   MRU " .. vim.fn.getcwd() } },
			{ type = "bookmarks", header = { "   Bookmarks" } },
			{ type = gitModified, header = { "   git modified" } },
			{ type = gitUntracked, header = { "   git untracked" } },
			{ type = "commands", header = { "   Commands" } },
		}

		local keymap = vim.keymap
		keymap.set("n", "<leader>s", "<cmd>Startify<CR>", { desc = "Open startify" })
	end,
}
