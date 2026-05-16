-- lua/plugins/mason.lua

local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
	vim.notify("mason.nvim not installed", vim.log.levels.WARN)
	return
end

local ok_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mlsp then
	vim.notify("mason-lspconfig.nvim not installed", vim.log.levels.WARN)
	return
end

mason.setup({
	ui = {
		border = "rounded",
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"docker_compose_language_service",
		"dockerls",
		"eslint",
		"gopls",
		"graphql",
		"harper_ls",
		"html",
		"jsonls",
		"lua_ls",
		"prismals",
		"pyright",
		"rust_analyzer",
		"sqls",
		"svelte",
		"terraformls",
		"ts_ls",
		"yamlls",
	},
})

local registry = require("mason-registry")

local tools = {
	"stylua",
	"isort",
	"black",
	"prettierd",
	"eslint_d",
	"goimports-reviser",
	"gofumpt",
	"golines",
	"sqlfmt",
}

local function ensure_tools()
	for _, tool in ipairs(tools) do
		local ok, pkg = pcall(registry.get_package, tool)

		if ok and not pkg:is_installed() then
			pkg:install()
		end
	end
end

if registry.refresh then
	registry.refresh(vim.schedule_wrap(ensure_tools))
else
	ensure_tools()
end
