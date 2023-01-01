local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {  "fish", "lua", "python", "ruby", "rust", "swift" },
    highlight = {
      enable = true,
      disable = { 'help' },
    },
  })
end

return M
