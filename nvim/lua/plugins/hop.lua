local mapping = require("../utils/mapping")

local M = {
  "phaazon/hop.nvim",
  keys = { "<leader><leader>f" }
}

function M.config()
  local hop = require('hop')
  hop.setup()

  mapping.nnoremap("<leader><leader>f", function() hop.hint_char1() end)
end

return M
