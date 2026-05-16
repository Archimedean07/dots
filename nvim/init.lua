vim.loader.enable()
require("vim._core.ui2").enable({
	enable = true,
	msg = {
		target = "cmd", -- options: cmd(classic), msg(similar to noice)
		pager = { height = 1 },
		msg = { height = 0.5, timeout = 4500 },
		dialog = { height = 0.5 },
		cmd = { height = 0.5 },
	},
})
require("config.options")
require("config.keymaps")
vim.pack.add({

	{ src = "dmtrKovalenko/fff.nvim" },
	{ src = "stevearc/oil.nvim" },
	{ src = "nvim-treesitter/nvim-treesitter" },
	{ src = "stevearc/conform.nvim" },
	{ src = "neovim/nvim-lspconfig" },
	{ src = "williamboman/mason.nvim" },
	{ src = "windwp/nvim-autopairs" },
	{ src = "williamboman/mason-lspconfig.nvim" },
	{ src = "christoomey/vim-tmux-navigator" },
	{ src = "blazkowolf/gruber-darker.nvim" },
	{ src = "windwp/nvim-ts-autotag" },
})

require("plugins")
-- vim.pack.add({ "https://github.com/zuqini/zpack.nvim" })
--
--
-- require("zpack").setup({
-- 	defaults = {
-- 		confirm = true,
-- 	},
-- 	performance = {
-- 		vim_loader = true,
-- 	},
-- 	cmd_prefix = "Z",
-- })
--
