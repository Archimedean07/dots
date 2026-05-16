-- lua/plugins/treesitter.lua
local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  vim.notify("nvim-treesitter not installed", vim.log.levels.WARN)
  return
end

local ensure_installed = {
  "json", "javascript", "typescript", "tsx", "go",
  "yaml", "html", "css", "python", "http", "prisma",
  "markdown", "markdown_inline", "svelte", "graphql",
  "bash", "lua", "vim", "dockerfile", "gitignore",
  "query", "vimdoc", "c", "java", "rust", "ron",
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then return end
    pcall(vim.treesitter.language.add, lang)
    pcall(vim.treesitter.start, buf, lang)
    if ft ~= "yaml" and ft ~= "markdown" then
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.bo[buf].smartindent = false
      vim.bo[buf].cindent = false
    end
  end,
})

-- nvim-ts-autotag
local ok2, autotag = pcall(require, "nvim-ts-autotag")
if not ok2 then return end

autotag.setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
  per_filetype = {
    ["html"] = { enable_close = true },
    ["typescriptreact"] = { enable_close = true },
  },
})
