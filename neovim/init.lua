local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Faster startup
    use 'lewis6991/impatient.nvim'

    -- Theme
    use 'Mofiqul/dracula.nvim'
    use 'folke/tokyonight.nvim'
    use 'https://gitlab.com/__tpb/monokai-pro.nvim'

    -- Lsp config
    use 'williamboman/mason.nvim'   
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' 
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-treesitter/nvim-treesitter'

    -- Setup and config rust_analyzer
    use 'simrat39/rust-tools.nvim'

    -- Telescope 
    use {
  	    'nvim-telescope/telescope.nvim', tag = '0.1.2',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- File explorer nvim-tree
    use {
  	    'nvim-tree/nvim-tree.lua',
    	requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    	},
    }

    -- Status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

     -- Pair brackets
    use {
	    'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Buffer Line
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Indent lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- Comment block
    use 'terrortylor/nvim-comment'

    -- terminal emulator
    use 'akinsho/toggleterm.nvim'

end)

require('user.config')

require('user.bufferline')
require('user.code-style')
require('user.clangd')
require('user.lsp')
require('user.lualine')
require('user.nvim-comment')
require('user.nvim-tree')
require('user.rust-tools')
require('user.telescope')
require('user.theme')
require('user.toggleterm')
