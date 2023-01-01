local indent = vim.api.nvim_create_augroup("indent", {clear = true})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "lua",
  group = indent,
  command = "setlocal ts=2 sts=2 sw=2"
})
vim.api.nvim_create_autocmd('Filetype', {
  pattern = "ruby",
  group = indent,
  command = "setlocal ts=2 sts=2 sw=2"
})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "yaml",
  group = indent,
  command = "setlocal ts=2 sts=2 sw=2"
})

local ft = vim.api.nvim_create_augroup("ft", {clear = true})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"Podfile", "*.podspec"},
  group = ft,
  command = "set ft=ruby"
})
