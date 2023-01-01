local mapping = require('utils.mapping')

vim.g.mapleader = " "
vim.g.maplocalleader = " "

mapping.nnoremap("<leader>s", ":w<CR>")
mapping.nnoremap("<leader>l", ":noh<CR>")

mapping.nnoremap("[b", ":bp<CR>")
mapping.nnoremap("]b", ":bn<CR>")

mapping.inoremap("jk", "<Esc>")
