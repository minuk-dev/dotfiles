return {
	"vimwiki/vimwiki",
	config = function()
		vim.g.vimwiki_list = {
			{
				path = "~/workspace/minuk-dev.github.io/_wiki",
				ext = ".md",
				diary_rel_path = ".",
			},
		}
		vim.g.vimwiki_conceallevel = 0
		local keymap = vim.keymap

		-- vimwiki keymaps
		keymap.set("n", "<leader>ww", "<Plug>VimwikiIndex", { desc = "Open vimwiki" })
		keymap.del("n", "<leader>wi")

		local api = vim.api

		function NewTemplate()
			local wiki_directory = false

			for _, wiki in ipairs(vim.g.vimwiki_list) do
				if vim.fn.expand("%:p:h") == vim.fn.expand(wiki.path) then
					wiki_directory = true
					break
				end
			end

			if not wiki_directory then
				return
			end

			if api.nvim_buf_line_count(0) > 1 then
				return
			end

			local template = {
				"---",
				"layout  : wiki",
				"title   : ",
				"summary : ",
				"date    : " .. os.date("%Y-%m-%d %H:%M:%S %z"),
				"lastmod : " .. os.date("%Y-%m-%d %H:%M:%S %z"),
				"tags    : ",
				"draft   : true",
				"parent  : ",
				"resource: " .. vim.fn.substitute(vim.fn.system("uuidgen"), "\n", "", ""),
				"---",
				"",
				"# ",
			}

			api.nvim_buf_set_lines(0, 0, 0, false, template)
			api.nvim_command("normal! G")
			api.nvim_command("normal! $")

			print("new wiki page has created")
		end

		api.nvim_create_autocmd("BufNewFile", {
			pattern = "*.md",
			command = "lua NewTemplate()",
		})

		function LastModified()
			if vim.g.md_modify_disabled then
				return
			end

			if vim.bo.modified then
				local save_cursor = api.nvim_win_get_cursor(0)
				local n = math.min(10, api.nvim_buf_line_count(0))
				api.nvim_command(
					"keepjumps exe '1,"
						.. n
						.. "s#^\\(.{,10}lastmod\\s*: \\).*#\\1"
						.. os.date("%Y-%m-%d %H:%M:%S %z")
						.. "#e'"
				)
				api.nvim_command("call histdel('search', -1)")
				api.nvim_win_set_cursor(0, save_cursor)
			end
		end
		api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.md",
			command = "lua LastModified()",
		})
	end,
}
