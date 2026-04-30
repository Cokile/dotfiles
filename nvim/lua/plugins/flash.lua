local mapping = require("utils.mapping")

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    local flash = require("flash")
    flash.setup(opts)

    mapping.nnoremap("<leader><leader>f", function() flash.jump() end)
  end,
}
