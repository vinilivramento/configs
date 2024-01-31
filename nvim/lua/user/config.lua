local opt = vim.opt
local g = vim.g
local map = vim.api.nvim_set_keymap

g.mapleader = ","
g.maplocalleader = ","

-- This option will restrict usage of some commands in non-default .vimrc files;
-- commands that write to file or execute shell commands are not allowed and map 
-- commands are displayed.
opt.secure = true

opt.autoread = true

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.cursorline = true
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.smarttab= true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.linespace = 0

opt.lbr = true
opt.textwidth = 500 

opt.autoindent = true
opt.smartindent = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.lazyredraw = true
opt.magic = true
opt.mat= 2 
opt.mouse = "a"
opt.scrolloff = 4

opt.showmatch = true

opt.laststatus = 2
opt.number = true
opt.ruler = true
opt.hid  = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400

opt.undofile = true
opt.history = 1000
opt.undolevels = 1000
opt.undoreload = 1000
opt.undofile = true
opt.undodir="~.nvim/.undo,/tmp"

opt.swapfile = false

-- Configure backspace so it acts as it should act
opt.backspace = "eol,start,indent"

opt.enc = "utf-8"
opt.fenc = "utf-8"
opt.termencoding = "utf-8"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

--code completion
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true}

-----------------------  Key Mappings -----------------------
vim.keymap.set("n", "<Tab>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { silent = true })

-- Faster moving 
vim.keymap.set("n", "<C-j>", "jjjj", { silent = true })
vim.keymap.set("n", "<C-k>", "kkkk", { silent = true })
vim.keymap.set("n", "<C-h>", "hhhh", { silent = true })
vim.keymap.set("n", "<C-l>", "llll", { silent = true })

-- Hard mapping of upper case letters in normal mode
vim.keymap.set("n", "H", "h", { silent = true })
vim.keymap.set("n", "J", "j", { silent = true })
vim.keymap.set("n", "K", "k", { silent = true })
vim.keymap.set("n", "L", "l", { silent = true })

-- yank from cursor to the end of the line
vim.keymap.set("n", "Y", "y$", { silent = true })

-- yank always yanks the whole word
vim.keymap.set("n", "yw", "yiw", { silent = true })

-------------------------------------------------------------
