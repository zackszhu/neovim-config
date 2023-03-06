require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
  }
)
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'rust_analyzer',
    'tsserver',
    'lua_ls',
    'zls',
    'pyright',
  }
})

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    local handlers = require('user.lsp.handlers')
    lspconfig[server_name].setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    })
  end,
})

