local M = {
  "mg979/vim-visual-multi",
  keys = { "<C-n>", "<C-S-n>", "<C-h>", "<C-l>" }
}

function M.config()
  local maps = {}
  maps["Undo"] = 'u'
  maps["Redo"] = '<C-r>'
  maps["Add Cursor Down"] = '<C-l>'
  maps["Add Cursor Up"] = '<C-h>'
  vim.g.VM_maps = maps
  vim.g.VM_mouse_mappings = 1
  vim.g.VM_show_warnings = 0
end

return M
