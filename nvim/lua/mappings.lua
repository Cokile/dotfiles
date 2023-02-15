local mapping = require('utils.mapping')

vim.g.mapleader = " "
vim.g.maplocalleader = " "

mapping.inoremap("jk", "<Esc>")

mapping.nnoremap("<leader>s", ":w<CR>")
mapping.nnoremap("<leader>l", ":noh<CR>")

mapping.nnoremap("[b", ":bp<CR>")
mapping.nnoremap("]b", ":bn<CR>")

-- Alt + number to switch to nth visible buffer
for i = 1,9 do
  mapping.nnoremap("<A-" .. i .. ">", function()
    local lines = {}
    for line in string.gmatch(vim.api.nvim_command_output("ls"), "[^\r?\n]+") do
      table.insert(lines, line)
    end
    if #lines >= i then
        local bufnr = string.match(lines[i], "^%s*(%d+)")
        vim.api.nvim_set_current_buf(tonumber(bufnr))
    end
  end)
end
