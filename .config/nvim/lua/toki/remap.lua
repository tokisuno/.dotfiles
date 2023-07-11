require("true-zen.ataraxis")
require("true-zen.minimalist")
require("true-zen.narrow")
require("true-zen.focus")
-- rebinds --
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local ks = vim.keymap
local api = vim.api
local opts = { noremap = true, silent = true }

-- writing
api.nvim_set_keymap("n", "<leader>'n", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>'n", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>'f", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>'m", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>'a", ":TZAtaraxis<CR>", {})
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
ks.set("n", "<C-d>", "<C-d>zz")
ks.set("n", "<C-u>", "<C-u>zz")
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

api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
api.nvim_set_keymap('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)

