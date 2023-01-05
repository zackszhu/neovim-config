local configs = require("nvim-treesitter.configs")
configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
      enable = true,
  },
  indent = {
      enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}


-- local just_ok, just = pcall(require, "tree-sitter-just")
-- if not just_ok then
--     return
-- end

-- just.setup({})


