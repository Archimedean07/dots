-- lua/plugins/conform.lua
local ok, conform = pcall(require, "conform")
if not ok then
  vim.notify("conform.nvim not installed", vim.log.levels.WARN)
  return
end

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    go = { "gofmt", "goimports" },
    c = { "clang-format" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    toml = { "taplo" },
    ["*"] = { "trim_whitespace" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>fa", function()
  conform.format({
    lsp_format = "fallback",
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
