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
    "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    "stevearc/dressing.nvim",
    "mrjones2014/legendary.nvim",

    -- Colorschemes
    "navarasu/onedark.nvim",
    "kyazdani42/nvim-web-devicons",

    -- cmp plugins
    "hrsh7th/nvim-cmp",         -- The completion plugin
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",      -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp" --snippet engine
    },

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
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cd build && make'
    },

    -- Other UIs
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opt = {},
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "nvim-treesitter/playground",
    "HiPhish/rainbow-delimiters.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    -- use("IndianBoy42/tree-sitter-just",

    -- Git
    "lewis6991/gitsigns.nvim",

    -- Buffers
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies =
        "kyazdani42/nvim-web-devicons"
    },
    "famiu/bufdelete.nvim",
    "nvim-lualine/lualine.nvim",

    -- Other
    "kyazdani42/nvim-tree.lua",
    "numToStr/Comment.nvim", -- Easily comment
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",   opts = {} },
    { "akinsho/toggleterm.nvim",             branch = "main" },
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
    {
        'abecodes/tabout.nvim',
        lazy = false,
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>',  -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = false,           -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end
    }
})
