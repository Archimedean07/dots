local ok, fff = pcall(require, "fff")
if not ok then
  vim.notify("fff.nvim not installed", vim.log.levels.WARN)
  return
end

fff.setup({
  debug = {
    enabled = false,
    show_scores = false,
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
})

vim.keymap.set("n", "ff", function() require("fff").find_files() end, { desc = "Find Files" })
vim.keymap.set("n", "fg", function() require("fff").live_grep() end, { desc = "Live Grep" })
vim.keymap.set("n", "fz", function() require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } }) end, { desc = "Fuzzy Grep" })
vim.keymap.set("n", "fc", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, { desc = "Search Word" })
