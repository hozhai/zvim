local opt = vim.opt
local g = vim.g


g.mapleader = " "

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.cursorline = true
opt.relativenumber = true
opt.cursorlineopt = "line"

opt.spell = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindent = true
opt.smartindent = true
opt.autoindent = true

opt.swapfile = false
opt.termguicolors = true
opt.wrap = false

opt.mouse = ""

g.background = "dark"

vim.keymap.set("n", "<c-k>", "<Cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<Cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<Cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<Cmd>wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.lsp.inlay_hint.enable()
