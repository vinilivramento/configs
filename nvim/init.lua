-- disable nerdtree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bootstrap lazy nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Themes
    "Mofiqul/dracula.nvim",
    "folke/tokyonight.nvim",
    "https://gitlab.com/__tpb/monokai-pro.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Lsp config
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp" ,
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/vim-vsnip",
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate" 
    },

    -- Fuzzy finder 
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- File explorer nvim-tree
    { 
   	    "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Status bar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Pair brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Buffer Line
    {
        "akinsho/bufferline.nvim", 
        version = "*", 
        dependencies = "nvim-tree/nvim-web-devicons"
    },

    -- Indent lines
    "lukas-reineke/indent-blankline.nvim",

    -- Comment block
    "terrortylor/nvim-comment",

    -- terminal emulator
    "akinsho/toggleterm.nvim",

    -- diagnostics list
    "folke/trouble.nvim", 

    -- test runner
    { 
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "alfaix/neotest-gtest",
            "nvim-neotest/neotest-python",
            "rouge8/neotest-rust"
        }
     },

    -- git integration 
    "tpope/vim-fugitive",

    -- sign column to indicate changes manages by version control system
    "airblade/vim-gitgutter",

    -- debugger adapter 
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },

    -- Setup and config rust_analyzer
    "simrat39/rust-tools.nvim",
})

-- define leader mapping and load basic config. It should come before the rest of plugin-specifi configuration
require("user.config")

-- plugin-specific configuration
require("user.bufferline")
require("user.code-style")
require("user.debugger")
require("user.lsp")
require("user.lualine")
require("user.neotest")
require("user.nvim-comment")
require("user.nvim-tree")
require("user.telescope")
require("user.theme")
require("user.toggleterm")
