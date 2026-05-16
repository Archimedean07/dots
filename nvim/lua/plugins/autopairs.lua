-- lua/plugins/autopairs.lua

local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	vim.notify("nvim-autopairs not installed", vim.log.levels.WARN)
	return
end

autopairs.setup({
	check_ts = true,
	disable_filetype = {
		"TelescopePrompt",
		"spectre_panel",
	},
})
