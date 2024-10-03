vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.lsp.set_log_level("DEBUG")
		local client = vim.lsp.start({
			name = "NoteLSP",
			cmd = { "/Users/chaojiezhu/Dev/rust/NoteLSP/target/debug/note_language_server" },
			root_dir = vim.fs.root(0, ".git"),
		})
		vim.lsp.buf_attach_client(0, client)
	end,
})
