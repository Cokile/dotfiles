local mappings = require("utils.mapping")

local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

function M.config()
  require("gitsigns").setup({
    preview_config = {
      border = 'none',
    },
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      mappings.nmap('[g', function()
        if vim.wo.diff then return '[g' end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr })

      mappings.nmap(']g', function()
        if vim.wo.diff then return ']g' end
        vim.schedule(function() gitsigns.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr })

      mappings.nmap('<leader>hb', function() gitsigns.blame_line{ full = true } end, { silent = true, buffer = bufnr })
      mappings.nmap('<leader>hp', gitsigns.preview_hunk, { silent = true, buffer = bufnr })
      mappings.map({ 'n', 'v' }, '<leader>hr', gitsigns.reset_hunk, { silent = true, buffer = bufnr })
    end
  })
end

return M
