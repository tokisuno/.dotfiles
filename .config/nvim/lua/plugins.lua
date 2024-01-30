return {
  {"nvim-telescope/telescope.nvim", version = '0.1.5', dependencies = {{'nvim-lua/plenary.nvim'}}},
  {"nvim-telescope/telescope-bibtex.nvim",
    dependencies = {{'nvim-telescope/telescope.nvim'},},
    config = function ()
      require"telescope".load_extension("bibtex")
      require"telescope".setup {
        extensions = {
          bibtex = {
            depth = 2,
            custom_formats = {},
            format = '',
            global_files = {"~/Sync/latex/bibs/philosophy.bib"},
            search_keys = { 'author', 'year', 'title' },
            citation_format = '{{author}} ({{year}}), {{title}}.',
            citation_trim_firstname = true,
            citation_max_auth = 2,
            context = false,
            context_fallback = true,
            wrap = false,
          },
        }
      }
    end,
  },
  {"Mofiqul/dracula.nvim"},
  {'norcalli/nvim-colorizer.lua'},
  {'nvim-treesitter/playground'},
  {'nvim-tree/nvim-tree.lua'},
  {'nvim-tree/nvim-web-devicons'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {"folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      {
        plugins = {
          marks = true, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
          presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
          },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        motions = {
          count = true,
        },
        icons = {
          breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
          separator = "➜", -- symbol used between a key and it's label
          group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
          scroll_down = "<c-d>", -- binding to scroll down inside the popup
          scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        window = {
          border = "none", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
          padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
          zindex = 1000, -- positive value to position WhichKey above other floating windows.
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specifiy a list manually
        -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
        triggers_nowait = {
          -- marks
          "`",
          "'",
          "g`",
          "g'",
          -- registers
          '"',
          "<c-r>",
          -- spelling
          "z=",
        },
        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for keymaps that start with a native binding
          i = { "j", "k" },
          v = { "j", "k" },
        },
        -- disable the WhichKey popup for certain buf types and file types.
        -- Disabled by default for Telescope
        disable = {
          buftypes = {},
          filetypes = {},
        },
      }
    }
  },

  -- writing,
  {'Pocco81/true-zen.nvim'},
  {'vim-pandoc/vim-pandoc'},
  {'Lukesmithxyz/vimling'},
  {'lervag/vimtex'},
  {'xuhdev/vim-latex-live-preview'},
  {'vimwiki/vimwiki'},
  -- notetaking
  {'zk-org/zk-nvim', config = function() 
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
  -- fzf
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},
  {'alok/notational-fzf-vim'},
  -- lsp
  {'hrsh7th/cmp-nvim-lsp'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {'saadparwaiz1/cmp_luasnip'},
}
