-- lua/plugins/lsp.lua
local ok, _ = pcall(require, "lspconfig")
if not ok then
  vim.notify("nvim-lspconfig not installed", vim.log.levels.WARN)
  return
end

vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    -- native LSP completion
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set("i", "<C-j>", "<C-n>", { buffer = ev.buf })
      vim.keymap.set("i", "<C-k>", "<C-p>", { buffer = ev.buf })
      vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { buffer = ev.buf })
      vim.keymap.set("i", "<CR>", function()
        return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
      end, { buffer = ev.buf, expr = true })
      vim.keymap.set("i", "<C-e>", function()
        return vim.fn.pumvisible() == 1 and "<C-e>" or "<C-e>"
      end, { buffer = ev.buf, expr = true })
    end

    opts.desc = "References"
    vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
    opts.desc = "Goto Declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    opts.desc = "Goto Definition"
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    opts.desc = "Goto Implementation"
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    opts.desc = "Goto Type Definition"
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    opts.desc = "Code Action"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    opts.desc = "Rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    opts.desc = "Buffer Diagnostics"
    vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, opts)
    opts.desc = "Line Diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    opts.desc = "Hover"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    opts.desc = "Signature Help"
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    opts.desc = "Format"
    vim.keymap.set("n", "<leader>fa", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    opts.desc = "Prev Diagnostic"
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, opts)
    opts.desc = "Next Diagnostic"
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, opts)
    opts.desc = "Restart LSP"
    vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  virtual_text = true,
  underline = true,
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
  },
})

vim.lsp.config("*", {
  root_markers = { ".git", "package.json", "Makefile", ".luarc.json" },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      completion = { callSnippet = "Replace" },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  single_file_support = true,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayVariableTypeHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

vim.lsp.config("cssls", {
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true, lint = { unknownAtRules = "ignore" } },
    scss = { validate = true, lint = { unknownAtRules = "ignore" } },
    less = { validate = true, lint = { unknownAtRules = "ignore" } },
  },
})

vim.lsp.config("tailwindcss", {
  filetypes = {
    "html", "css", "javascript", "typescript",
    "javascriptreact", "typescriptreact", "svelte",
  },
})

vim.lsp.enable({
  "lua_ls", "ts_ls", "gopls", "cssls",
  "tailwindcss", "pyright", "rust_analyzer",
  "yamlls", "jsonls", "html",
})
