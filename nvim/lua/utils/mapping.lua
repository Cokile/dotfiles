local M = {}

function M.map(mode, lhs, rhs, opts)
  opts = opts or {silent = true}
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.noremap(mode, lhs, rhs, opts)
  opts = opts or {noremap = true, silent = true}
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.exprnoremap(mode, lhs, rhs, opts)
  opts = opts or {noremap = true, silent = true, expr = true}
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts) M.map('i', lhs, rhs, opts) end

function M.nmap(lhs, rhs, opts) M.map('n', lhs, rhs, opts) end

function M.vmap(lhs, rhs, opts) M.map('v', lhs, rhs, opts) end

function M.xmap(lhs, rhs, opts) M.map('x', lhs, rhs, opts) end

function M.nnoremap(lhs, rhs, opts) M.noremap('n', lhs, rhs, opts) end

function M.vnoremap(lhs, rhs, opts) M.noremap('v', lhs, rhs, opts) end

function M.xnoremap(lhs, rhs, opts) M.noremap('x', lhs, rhs, opts) end

function M.inoremap(lhs, rhs, opts) M.noremap('i', lhs, rhs, opts) end

function M.tnoremap(lhs, rhs, opts) M.noremap('t', lhs, rhs, opts) end

function M.exprnnoremap(lhs, rhs, opts) M.exprnoremap('n', lhs, rhs, opts) end

function M.exprinoremap(lhs, rhs, opts) M.exprnoremap('i', lhs, rhs, opts) end

return M
