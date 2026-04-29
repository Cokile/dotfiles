local mapping = require("utils.mapping")

return {
  "smoka7/hop.nvim",
  keys = { "<leader><leader>f" },
  config = function()
    local hop = require('hop')
    hop.setup()

    mapping.nnoremap("<leader><leader>f", function() hop.hint_char1() end)
  end,
}
