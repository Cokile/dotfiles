local mappings = require("../utils/mapping")

local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  keys = { "<C-p>", "<A-f>" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}

function M.config()
  local builtin = require('telescope.builtin')
  local function project_files()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
      builtin.git_files()
    else
      builtin.find_files()
    end
  end
  mappings.nmap("<C-p>", project_files)
  mappings.nmap("<A-f>", builtin.live_grep)

  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      prompt_prefix = ">>> ",
      sorting_strategy = 'ascending',
      layout_strategy = 'flex',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
        },
        vertical = {
          prompt_position = 'top',
        },
      },
      mappings = {
        i = {
          ["jk"] = { "<esc>", type = "command" },
          ["<C-u>"] = false,
          ["<C-j>"] = {
            actions.move_selection_next, type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-k>"] = {
            actions.move_selection_previous, type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-h>"] = {
            actions.cycle_history_prev, type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-l>"] = {
            actions.cycle_history_next, type = "action",
            opts = { nowait = true, silent = true },
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
      },
    }
  })
  telescope.load_extension("fzf")
end

return M
