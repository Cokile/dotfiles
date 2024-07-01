local mappings = require("utils.mapping")

local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

function M.config()
  require("gitsigns").setup({
    current_line_blame_opts = {
      relative_time = true
    },
    preview_config = {
      border = 'none',
    },
    on_attach = function(bufnr)
      mappings.nmap('[g', function()
        if vim.wo.diff then return '[g' end
        vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr })

      mappings.nmap(']g', function()
        if vim.wo.diff then return ']g' end
        vim.schedule(function() package.loaded.gitsigns.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr })

      mappings.nmap('<leader>hb', function() package.loaded.gitsigns.blame_line{ full = true } end, { silent = true, buffer = bufnr })
      mappings.nmap('<leader>hp', package.loaded.gitsigns.preview_hunk, { silent = true, buffer = bufnr })
      mappings.map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { silent = true, buffer = bufnr })
    end
  })
end

return M
