-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- General Customization
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
            config = function()
                require"startup".setup()
            end
    }
    use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use('vim-pandoc/vim-pandoc-syntax')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('norcalli/nvim-colorizer.lua')
    use('nvim-treesitter/playground')
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons
    use('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
    use('dapplebeforedawn/vim-typing-practice')
    use('xiyaowong/transparent.nvim')
    use('nvim-lualine/lualine.nvim')
    use('tpope/vim-fugitive')
    use {'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'}


    -- navigation
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use("numToStr/FTerm.nvim")

    -- For writing
    use('vim-pandoc/vim-pandoc')
    use('Lukesmithxyz/vimling')
    use('Pocco81/true-zen.nvim')
    use('folke/twilight.nvim')
    use('lervag/vimtex')
    use('xuhdev/vim-latex-live-preview')

    -- life management
    use('vimwiki/vimwiki')
    use('mattn/calendar-vim')
    -- for funzies
    use('ThePrimeagen/vim-be-good')

    -- lsp shit 
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim',
                 run = function() pcall(vim.cmd, 'MasonUpdate') end},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
end)
