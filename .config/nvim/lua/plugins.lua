return {
  {"nvim-telescope/telescope.nvim", version = '0.1.1', dependencies = {{'nvim-lua/plenary.nvim'}}},
  {"Mofiqul/dracula.nvim"},
  {'norcalli/nvim-colorizer.lua'},
  {'nvim-treesitter/playground'},
  {'nvim-tree/nvim-tree.lua'},
  {'nvim-tree/nvim-web-devicons'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  -- navigation
  {"numToStr/FTerm.nvim"},
  -- writing,
  {'preservim/tagbar'},
  {'vim-pandoc/vim-pandoc'},
  {'Lukesmithxyz/vimling'},
  {'Pocco81/true-zen.nvim'},
  {'lervag/vimtex'},
  {'xuhdev/vim-latex-live-preview'},
  { "iamcco/markdown-preview.nvim", build = "cd app && npm install", init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
  {'vim-pandoc/vim-pandoc-syntax'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {'jalvesaq/Nvim-R', lazy = false},

  {"nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Sync/neorg/",
              },
            },
          },
        },
      }
    end,
  },

}
