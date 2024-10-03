require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"clangd",
		"rust_analyzer",
		"ts_ls",
		"lua_ls",
		"zls",
		"pyright",
		"ruff",
		"clang-format",
		"stylua",
		"isort",
		"black",
	},
	run_on_start = true,
	integrations = {
		["mason-lspconfig"] = true,
		["mason-null-ls"] = true,
		["mason-nvim-dap"] = true,
	},
})

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
	function(server_name)
		local handlers = require("user.lsp.handlers")
		lspconfig[server_name].setup({
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
		})
	end,
})
