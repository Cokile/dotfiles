local mapping = require("utils.mapping")

return {
  "mhinz/vim-sayonara",
  keys = { "<A-q>" },
  cmd = { "Sayonara" },
  config = function()
    mapping.nnoremap("<A-q>", ":Sayonara<CR>")
  end,
}
