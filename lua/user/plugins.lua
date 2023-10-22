-- Disable built in plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"stevearc/dressing.nvim",
	"mrjones2014/legendary.nvim",

	-- Colorschemes
	"navarasu/onedark.nvim",
	"kyazdani42/nvim-web-devicons",

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"simrat39/rust-tools.nvim",
	"ray-x/lsp_signature.nvim",
	"ziglang/zig.vim",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/playground",
	"HiPhish/nvim-ts-rainbow2",
	"nvim-treesitter/nvim-treesitter-context",
	-- use("IndianBoy42/tree-sitter-just",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Buffers
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "kyazdani42/nvim-web-devicons" },
	"famiu/bufdelete.nvim",
	"nvim-lualine/lualine.nvim",

	-- Other
	"kyazdani42/nvim-tree.lua",
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "akinsho/toggleterm.nvim", branch = "main" },
	"j-hui/fidget.nvim",
	"pianocomposer321/yabs.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")
			leap.set_default_keymaps()
			-- leap.leap({ target_windows = { vim.fn.win_getid() } })
		end,
	},
})
