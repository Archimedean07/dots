return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		debug = {
			enabled = true,
			show_scores = true,
		},
		keymaps = {
			close = "<Esc>",
			select = "<CR>",
			select_split = "<C-s>",
			select_vsplit = "<C-v>",
			select_tab = "<C-t>",
			move_up = { "<Up>", "<C-k>" },
			move_down = { "<Down>", "<C-j>" },
			preview_scroll_up = "<C-u>",
			preview_scroll_down = "<C-d>",
			toggle_debug = "<F2>",
			cycle_grep_modes = "<S-Tab>",
			cycle_previous_query = "<C-Up>",
			toggle_select = "<Tab>",
			send_to_quickfix = "<C-q>",
			focus_list = "<leader>l",
			focus_preview = "<leader>p",
		},
	},
	lazy = false,
	keys = {
		{
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "Find Files",
		},
		{
			"fg",
			function()
				require("fff").live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"fz",
			function()
				require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
			end,
			desc = "Fuzzy Grep",
		},
		{
			"fc",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search Word",
		},
	},
}
