return {
  {"nvim-telescope/telescope.nvim", version = '0.1.5', dependencies = {{'nvim-lua/plenary.nvim'}}},
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
  {'Pocco81/true-zen.nvim'},
  {'vim-pandoc/vim-pandoc'},
  {'Lukesmithxyz/vimling'},
  {'lervag/vimtex'},
  {'xuhdev/vim-latex-live-preview'},
  {'vimwiki/vimwiki'},
  {'zk-org/zk-nvim',
    config = function()
      require("zk").setup({
        picker = "select",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end
  },
  -- {'jghauser/papis.nvim',
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("papis").setup({
  --     -- Your configuration goes here
  --     })
  --   end,
  -- },
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},
  {'alok/notational-fzf-vim'},
  -- lsp
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
}
