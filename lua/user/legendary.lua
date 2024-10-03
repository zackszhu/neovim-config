local helpers = require("legendary.toolbox")

require("legendary").setup({
	-- Include builtins by default, set to false to disable
	include_builtin = false,
	-- Include the commands that legendary.nvim creates itself
	-- in the legend by default, set to false to disable
	include_legendary_cmds = true,
	-- Customize the prompt that appears on your vim.ui.select() handler
	-- Can be a string or a function that takes the `kind` and returns
	-- a string. See "Item Kinds" below for details. By default,
	-- prompt is 'Legendary' when searching all items,
	-- 'Legendary Keymaps' when searching keymaps,
	-- 'Legendary Commands' when searching commands,
	-- and 'Legendary Autocmds' when searching autocmds.
	select_prompt = nil,
	-- Optionally pass a custom formatter function. This function
	-- receives the item as a parameter and must return a table of
	-- non-nil string values for display. It must return the same
	-- number of values for each item to work correctly.
	-- The values will be used as column values when formatted.
	-- See function `get_default_format_values(item)` in
	-- `lua/legendary/formatter.lua` to see default implementation.
	formatter = nil,
	-- When you trigger an item via legendary.nvim,
	-- show it at the top next time you use legendary.nvim
	most_recent_item_at_top = true,
	-- Initial keymaps to bind
	keymaps = {
		{ "<leader>s", ":wa<CR>", description = "Write all buffers", opts = {} },
        { "<leader>bd", ":Bdelete<CR>", description = "Close current buffer", opts = {} },
        { "<leader>bn", ":bnext<CR>", description = "Go to next buffer", opts = {} },
        { "<leader>bp", ":bprev<CR>", description = "Go to previous buffer", opts= {} },
		{ "<leader>gf", require("telescope.builtin").find_files, description = "Go to files", opt = {} },
		{ "<leader>gg", require("telescope.builtin").live_grep, description = "Go to Grep Results", opt = {} },
		{ "<leader>gd", vim.lsp.buf.definition, description = "Go to Definition", opt = {} },
		{ "<leader>gD", vim.lsp.buf.declaration, description = "Go to Decleration", opt = {} },
		{ "<leader>gi", vim.lsp.buf.implementation, description = "Go to Implementation", opt = {} },
		{ "<leader>gh", ":ClangdSwitchSourceHeader<CR>", description = "Go to Header", opt = {} },
		{ "<leader>ll", require("telescope.builtin").lsp_references, description = "List References", opt = {} },
		{
			"<leader>ls",
			require("telescope.builtin").lsp_workspace_symbols,
			description = "List all symbols in the workspace",
			opt = {},
		},
		{
			"<leader>lt",
			require("telescope.builtin").treesitter,
			description = "List all symbols in the current file",
			opt = {},
		},
		{
			"<leader>ld",
			require("telescope.builtin").diagnostics,
			description = "List all diagnostics in the workspace",
			opt = {},
		},
		{ "<leader>lc", vim.lsp.buf.code_action, description = "List all code actions under the cursor", opt = {} },
        { "<leader>lk", helpers.lazy(require('legendary').find, { kind = "keymaps" }), description = "List all keybindings", opt = {} },
		{ "<leader>r", vim.lsp.buf.rename, description = "Rename under the cursor", opt = {} },
		{
			"<leader>d",
			helpers.lazy(vim.diagnostic.open_float, 0, { scope = "line", border = "rounded" }),
			description = "Show diagnostic message under the cursor",
			opt = {},
		},
        { "<leader>ee", ":NvimTreeToggle<CR>", description = "Toggle File Explorer", opt = {} },
        { "<leader>ef", ":NvimTreeFindFile<CR>", description = "Find the file in file explorer", opt = {} },
        { "<leader>f", function() require("conform").format({ async = true }) end, description = "Format the File", opt = {} },
        { "<leader>hs", vim.lsp.buf.hover, description = "Hover the cursor to show the signiture", opt = {} },
        { "<leader>tt", ":Telescope yabs tasks<CR>", description = "List and Run Tasks", opt = {} },
        { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, description = "Toggle all diagnostics in the workspace", opt = {}},
        { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, description = "Toggle all diagnostics in the document", opt = {}},
        { "<leader>xt", ":TodoTrouble<CR>", description = "Toggle all TODOs in the document", opt = {}},
	},
	-- Initial commands to bind
	commands = {
		-- your command tables here
	},
	-- Initial augroups and autocmds to bind
	autocmds = {
		-- your autocmd tables here
	},
	-- Automatically add which-key tables to legendary
	-- see "which-key.nvim Integration" below for more details
	auto_register_which_key = false,
	-- settings for the :LegendaryScratch command
	scratchpad = {
		-- configure how to show results of evaluated Lua code,
		-- either 'print' or 'float'
		-- Pressing q or <ESC> will close the float
		display_results = "float",
	},
})
