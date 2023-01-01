local M = {
  "sainnhe/gruvbox-material",
}

function M.config()
  vim.g.gruvbox_material_background = "soft"
  vim.g.gruvbox_material_sign_column_background = "none"
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_disable_italic_comment = 1
  vim.g.gruvbox_material_diagnostic_text_highlight = 1
end

return M
