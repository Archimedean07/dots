-- lua/plugins/oil.lua

local ok, oil = pcall(require, "oil")
if not ok then
	vim.notify("oil.nvim not installed", vim.log.levels.WARN)
	return
end

oil.setup({
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = false,

	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
})
