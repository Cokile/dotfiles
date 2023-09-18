local mapping = require("utils.mapping")

local M = {
  "neoclide/coc.nvim",
  branch = "release",
  event = { "BufNewFile", "BufReadPre" },
  keys = { "<leader>1" },
}

function M.config()
  vim.g.coc_global_extensions = {
    "coc-explorer",
    "coc-json",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    "coc-sourcekit",
    "coc-toml",
    "coc-yaml",
  }

  local function show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
      vim.api.nvim_command("h " .. cw)
    elseif vim.api.nvim_eval("coc#rpc#ready()") then
      vim.fn.CocActionAsync("doHover")
    else
      vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
    end
  end

  function _G.check_backspace()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
  end

  local function toggle_call_hierarchy()
    local winid = vim.api.nvim_eval("coc#window#find('cocViewId', 'calls')")
    if winid == -1 then
      vim.fn.CocActionAsync("showIncomingCalls")
    else
      vim.api.nvim_eval("coc#window#close(" .. winid .. ")")
    end
  end

  local function toggle_outline()
    local winid = vim.api.nvim_eval("coc#window#find('cocViewId', 'OUTLINE')")
    if winid == -1 then
      vim.fn.CocActionAsync("showOutline", 0)
    else
      vim.api.nvim_eval("coc#window#close(" .. winid .. ")")
    end
  end

  local function toggle_diagnostics()
    local loclist_open = vim.api.nvim_eval("get(getloclist(0, {'winid':0}), 'winid', 0)")
    if loclist_open == 0 then
      vim.api.nvim_command('CocDiagnostics')
    else
      vim.api.nvim_command('lclose')
    end
  end

  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  mapping.imap("<TAB>", [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "<TAB>" : coc#refresh()]], opts)
  mapping.imap("<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"]], opts)
  mapping.imap("<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  mapping.nnoremap("<leader>fa", "<Plug>(coc-codeaction)")
  mapping.nnoremap("<leader>fd", show_docs)
  mapping.nnoremap("<leader>fh", toggle_call_hierarchy)
  mapping.nnoremap("<leader>ft", toggle_outline)

  mapping.nnoremap("<leader>1", ":CocCommand explorer<CR>")
  mapping.nnoremap("<leader>4", toggle_diagnostics)

  mapping.nmap("<leader>rn", "<Plug>(coc-rename)")
  mapping.nmap("<leader>qf", "<Plug>(coc-fix-current)")

  mapping.nmap("gd", "<Plug>(coc-definition)")
  mapping.nmap("gr", "<Plug>(coc-references)")
  mapping.nmap("gi", "<Plug>(coc-implementation)")

  mapping.nmap("[d", "<Plug>(coc-diagnostic-prev)")
  mapping.nmap("]d", "<Plug>(coc-diagnostic-next)")

  vim.api.nvim_create_augroup("CocGroup", {})
  vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
  })
end

return M
