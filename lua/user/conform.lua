require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        cpp = { "clang-format" }
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" }
})
