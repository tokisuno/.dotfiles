vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Getting LaTeX to work
--
vim.g['tex_flavor'] = 'latex'
vim.g['vimtex_compiler_latexmk_engines'] = {['_'] = '-xelatex'}
vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_view_general_viewer'] = 'okular'
vim.g['vimtex_view_genral_options'] = '--unique file:@pdf#src@line@tex'
vim.g['vimtex_view_automatic'] = 1

-- vim.g['autocmd!'] = "User GoyoEnter Limelight"
-- vim.g['autocmd!'] = "User GoyoLeave Limelight!"
