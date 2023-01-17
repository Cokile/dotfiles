-- local indent = vim.api.nvim_create_augroup("indent", {clear = true})

local ft = vim.api.nvim_create_augroup("ft", {clear = true})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"Podfile", "*.podspec"},
  group = ft,
  command = "set ft=ruby"
})
