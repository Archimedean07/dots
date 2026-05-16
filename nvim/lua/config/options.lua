local opt = vim.opt
local au = vim.api.nvim_create_autocmd

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect", "fuzzy","popup" }
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.winborder = "rounded"
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10
opt.showmode = false
opt.autocomplete = false
opt.complete = "o,.,w,b,u"
opt.shortmess:prepend("c") -- avoid having to press enter on snippet completion
au("LspAttach", { command = "setlocal complete=o" })

opt.showtabline = 1 -- always show tabs
opt.smartcase = true -- smart case
opt.autoindent = true
opt.smartindent = true -- make indenting smarter again
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 50 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
opt.backspace = "indent,eol,start"
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 0
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.title = true
opt.titlelen = 0 -- do not shorten title
-- colorcolumn = "80",
-- colorcolumn = "120",
opt.fillchars = vim.opt.fillchars + "eob: "
opt.fillchars:append({
	stl = " ",
})

opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
opt.iskeyword:append("-")

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
