require("true-zen.ataraxis")
require("true-zen.minimalist")
require("true-zen.narrow")
require("true-zen.focus")

-- rebinds --
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- aliases
local ks = vim.keymap
local opts = { noremap = true, silent = true }

-- writing
ks.set("n", "<leader>'n", ":TZNarrow<CR>", {})
ks.set("v", "<leader>'n", ":'<,'>TZNarrow<CR>", {})
ks.set("n", "<leader>'f", ":TZFocus<CR>", {})
ks.set("n", "<leader>'m", ":TZMinimalist<CR>", {})
ks.set("n", "<leader>'a", ":TZAtaraxis<CR>", {})
ks.set("n", "<leader>'r", ":Twilight<CR>")

-- primeagen binds
ks.set("i", "<C-c>", "<Esc>")
ks.set("v", "J", ":m '>+1<CR>gv=gv")
ks.set("v", "K", ":m '<-2<CR>gv=gv")
ks.set("n", "o", "o<esc>")
ks.set("n", "O", "O<esc>")
ks.set("n", "J", "mzJ`z")
ks.set("n", "<leader>pv", vim.cmd.Ex)

-- vimling stuff
ks.set("n", "<localleader><localleader>d", ":call ToggleDeadKeys()<CR>", {})
ks.set("i", "<localleader><localleader>d", "<esc>:call ToggleDeadKeys()<CR>a", {})
ks.set("n", "<localleader><localleader>i", ":call ToggleIPA()<CR>", {})
ks.set("i", "<localleader><localleader>i", "<esc>:call ToggleIPA()<CR>a", {})

-- visual/replacement binds
-- ks.set("n", "<C-d>", "<C-d>zz")
-- ks.set("n", "<C-u>", "<C-u>zz")
ks.set("n", "n", "nzzzv")
ks.set("n", "N", "Nzzzv")
ks.set("n", "<C-k>", "<cmd>cnext<CR>zz")
ks.set("n", "<C-j>", "<cmd>cprev<CR>zz")
ks.set("n", "<leader>k", "<cmd>lnext<CR>zz")
ks.set("n", "<leader>j", "<cmd>lprev<CR>zz")
ks.set("n", "<leader>d", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
ks.set("x", "<leader>p", [["_dP]])

-- sets launch perms for file being written to
ks.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- custom binds
ks.set('n', '<leader>wf', "<cmd>w<cr>")
ks.set('n', '<leader>wer', "<cmd>wq<cr>")
ks.set('n', '<leader>s', "<>so<cr>")
ks.set('n', 'j', 'gj')
ks.set('n', 'k', 'gk')
ks.set('n', '<F5>', vim.cmd.UndotreeToggle)
ks.set('n', '<leader>fj', vim.cmd.NvimTreeToggle)
ks.set('n', '<A-,>', vim.cmd.bprev)
ks.set('n', '<A-.>', vim.cmd.bnext)
ks.set('n', '<A-q>', '<cmd>bw<cr>', opts)
ks.set('n', '<leader>sci', '<cmd>lua vim.opt.signcolumn="yes"<cr>')
ks.set('n', '<leader>sco', '<cmd>lua vim.opt.signcolumn="no"<cr>')

-- fterm binds
ks.set('n', '<C-h>', '<CMD>lua require("FTerm").toggle()<CR>')
ks.set('t', '<C-h>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- luasnip binds
vim.cmd[[
    " Use Tab to expand and jump through snippets
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
    
    " Jump forward in through tabstops in insert and visual mode with Control-f
    imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
    smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'

    " Use Shift-Tab to jump backwards through snippets
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

