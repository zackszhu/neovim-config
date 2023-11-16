if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
	require("user.options")
	require("user.keymaps")
	require("user.plugins")
	require("user.colorscheme")
	require("user.cmp")
	require("user.lsp")
	require("user.telescope")
	require("user.treesitter")
	require("user.autopairs")
	require("user.comment")
	require("user.gitsigns")
	require("user.nvim-tree")
	require("user.nvim-treesitter-context")
	require("user.indent-blankline")
	require("user.toggleterm")
	require("user.bufferline")
	require("user.lualine")
	require("user.fidget")
	require("user.yabs")
	require("user.dressing")
	require("user.legendary")
end
