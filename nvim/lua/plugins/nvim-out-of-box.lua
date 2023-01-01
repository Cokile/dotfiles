return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf"
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc" },
      { "gcb" },
      { "gc", mode = "v" },
      { "gb", mode = "v" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    keys = {
      { "ys" },
      { "cs" },
      { "ds" },
      { "S", mode = "v" },
    },
    config = function()
      require("nvim-surround").setup()
    end,
  },
}
