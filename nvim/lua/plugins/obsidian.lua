-- Note IDs: 202610010904-my-note-title
local function note_id(title)
	local id = os.date("%Y%m%d%H%M")
	if not title or title == "" then
		return id
	end
	local slug = title:lower():gsub('[\\/:*?"<>|]', ""):gsub("%s+", "-")
	return id .. "-" .. slug
end

local function journal_today()
	local vault = vim.fn.expand("~/vaults/Mind Palace")
	local name = os.date("%Y-%m-%d") .. "-journal"
	local path = vault .. "/journal/" .. name .. ".md"
	local is_new = vim.uv.fs_stat(path) == nil

	vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
	vim.cmd.edit(vim.fn.fnameescape(path))

	if is_new then
		vim.cmd("Obsidian template journal-template.md")
	end
end

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	cmd = "Obsidian",
	keys = {
		{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "New note" },
		{ "<leader>oo", "<cmd>Obsidian open<cr>", desc = "Open note" },
		{ "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Find note" },
		{ "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search notes" },
		{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
		{ "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Tags" },
		{ "<leader>od", "<cmd>Obsidian today<cr>", desc = "New daily template" },
		{ "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday's daily template" },
		{ "<leader>or", "<cmd>Obsidian tomorrow<cr>", desc = "Tomorrow's daily template" },
		{ "<leader>op", "<cmd>Obsidian paste_image<cr>", desc = "Paste image into note" },
		{ "<leader>oj", journal_today, desc = "Today's journal" },
	},
	opts = {
		legacy_commands = false,
		workspaces = {
			{ name = "Mind Palace", path = "~/vaults/Mind Palace" },
		},
		picker = { name = "snacks.picker" },
		sync = { enabled = true },
		notes_subdir = "notes",
		new_notes_location = "notes_subdir",
		templates = { folder = "templates" },
		note = { template = "zettel-template.md" },
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
			template = "daily-template.md",
			default_tags = { "todo" },
			workdays_only = false,
		},
		note_id_func = note_id,
	},
}
