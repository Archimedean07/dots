local ok, _ = pcall(require, "gruber-darker")
if not ok then
  vim.notify("gruber-darker not installed", vim.log.levels.WARN)
  return
end

vim.cmd.colorscheme("gruber-darker")
