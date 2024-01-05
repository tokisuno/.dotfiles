lua vim.opt.termguicolors = true

lua vim.g.mapleader = " "
lua vim.g.maplocalleader = ","
lua require('lazy-config')
lua require('remap')
lua require('colorizer').setup()
lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
colorscheme dracula-soft

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set nocompatible
filetype on
filetype plugin on 
syntax on
syntax enable
let R_assign = 0

set guicursor=""
set nu 
set relativenumber 
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab 
set updatetime=50
lua vim.opt.scrolloff=6
lua vim.opt.signcolumn="no"
set wrap linebreak nolist

set noswapfile nobackup
lua vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
lua vim.opt.isfname:append("@-@")
set undofile 

set nohlsearch incsearch
set smartcase smarttab smartindent breakindent
set showcmd showmode showmatch

set history=100
set mouse=a
set t_Co=256

lua vim.g['tex_flavor'] = 'latex'
lua vim.g['vimtex_compiler_latexmk_engines'] = {['_'] = '-xelatex'}
lua vim.g['vimtex_view_method'] = 'zathura'
lua vim.g['vimtex_view_general_viewer'] = 'zathura'
lua vim.g['vimtex_view_genral_options'] = '--unique file:@pdf#src@line@tex'
lua vim.g['vimtex_compiler_method'] = 'latexmk'
lua vim.g['vimtex_view_automatic'] = 1
