local mapping = require("utils.mapping")

local M = {
  "mhinz/vim-sayonara",
  keys = { "<A-q>" },
  cmd = { "Sayonara" },
}

function M.config()
  mapping.nnoremap("<A-q>", ":Sayonara<CR>")
end

return M
