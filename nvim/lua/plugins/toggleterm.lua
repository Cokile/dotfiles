local mapping = require("utils.mapping")

local M = {
  "akinsho/toggleterm.nvim",
  keys = { [[<C-\>]], "<leader>g" },
  cmd = { "ToggleTerm" },
}

function M.config()
  require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    direction = "float",
    shade_terminals = false,
  })

  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = "lag",
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })

  mapping.nnoremap("<leader>g", function() lazygit:toggle() end)
end

return M
