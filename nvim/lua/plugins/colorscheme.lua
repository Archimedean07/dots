local ok, _ = pcall(require, "gruber-darker")
if not ok then
  vim.notify("gruber-darker not installed", vim.log.levels.WARN)
  return
end

vim.cmd.colorscheme("gruber-darker")
-- fix underlines of links
vim.api.nvim_set_hl(0, '@markup.link.label.tsx', { underline = false })
vim.api.nvim_set_hl(0, '@markup.link.label', { underline = false })
