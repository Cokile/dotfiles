"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
vim.cmd("packadd packer.nvim")
require('packer').startup(function(use)
  use {'lewis6991/impatient.nvim', config = function() require('impatient') end }

  use { 'wbthomason/packer.nvim', opt = true }
  
  use { 'Yggdroot/LeaderF', event = 'VimEnter', run = ':LeaderfInstallCExtension' }
  use { 'honza/vim-snippets', event = 'InsertEnter' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf'}
  use { 'neoclide/coc.nvim', branch = 'release' } 
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = function()
      require('gitsigns').setup {
        _extmark_signs = true,
        current_line_blame_opts = {
          relative_time = true
        },
        preview_config = {
          border = 'none',
        },
        on_attach = function(bufnr)
          vim.keymap.set('n', '[g', function()
            if vim.wo.diff then return '[g' end
            vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, buffer = bufnr })

          vim.keymap.set('n', ']g', function()
            if vim.wo.diff then return ']g' end
            vim.schedule(function() package.loaded.gitsigns.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, buffer = bufnr })

          vim.keymap.set('n', '<leader>hb', function() package.loaded.gitsigns.blame_line{ full = true } end, { silent = true, buffer = bufnr })
          vim.keymap.set('n', '<leader>hp', package.loaded.gitsigns.preview_hunk, { silent = true, buffer = bufnr })
          vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { silent = true, buffer = bufnr })
        end
      }
    end
  }
  
  use { 'mg979/vim-visual-multi', event = 'VimEnter' }
  use { 'Raimondi/delimitMate', event = 'InsertEnter' }
  use { 'tpope/vim-surround', event = 'VimEnter' }
  use { 'wellle/targets.vim', event = 'VimEnter' }
  use {
    'numToStr/Comment.nvim',
    opt = true,
    keys = {
      { 'n', 'gcc' }, { 'v', 'gc' }
    },
    config = function()
      require('Comment').setup()
    end
  }
  use { 
    'phaazon/hop.nvim',
    opt = true,
    keys = {
      { 'n', '<leader><leader>f' }
    },
    config = function()
      require('hop').setup()
      vim.keymap.set('n', '<leader><leader>f', "<cmd>lua require'hop'.hint_char1()<cr>", { silent = true })
    end
  } 
  
  use { 'tpope/vim-repeat', event = 'VimEnter' }
  
  use 'sainnhe/gruvbox-material'
  use {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'gruvbox-material',
          section_separators = '',
          component_separators = '|',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'filename' },
          lualine_c = {
            {
              'diagnostics',
              sources = { 'coc' },
              diagnostics_color = {
                error = 'DiagnosticError',
                warn  = 'DiagnosticWarn',
                info  = 'DiagnosticInfo',
                hint  = 'DiagnosticHint',
              },
            },
          },
          lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'location' },
          lualine_z = { 'progress' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = { 'buffers' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'tabs' }
        },
        extensions = { 'quickfix' },
      }
    end
  }
  use { 
    'nvim-treesitter/nvim-treesitter',
    opt = true,
    event = 'BufRead',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {  "fish", "go", "lua", "python", "ruby", "rust", "swift", "typescript" },
        highlight = {
          enable = true,
          disable = { 'help' },
        },
      }
    end
  }
end)
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets
set termguicolors
set background=light

set timeoutlen=800
set updatetime=300

set autochdir
set autowrite
set nobackup
set noswapfile
set nowritebackup

set clipboard^=unnamed,unnamedplus
set mouse=a

set expandtab
set backspace=2
set softtabstop=4
set shiftwidth=4
set tabstop=4

set ignorecase
set smartcase

set number
set relativenumber
set signcolumn=yes

set lazyredraw
set cursorline

set noshowmode

set wildmode=full

set sidescrolloff=5
set scrolloff=5

set formatoptions-=t
set completeopt-=preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" common maps
let mapleader = " "

nnoremap <silent><leader>s :w<CR>
nnoremap <silent><leader>l :noh<CR>

nnoremap <silent>[b :bprevious<CR>
nnoremap <silent>]b :bnext<CR>
nnoremap <silent><A-q> :bd<CR>

inoremap jk <Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype proto setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd BufNewFile,BufRead *.swift set ft=swift
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" classic plugins configuration
" configure coc
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-go',
  \ 'coc-json',
  \ 'coc-pyright',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-sourcekit',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ ]

function! s:check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! s:toggle_outline() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline', 0)
  else
    call coc#window#close(winid)
  endif
endfunction

function! s:toggle_call_hierarchy() abort
  let winid = coc#window#find('cocViewId', 'calls')
  if winid == -1
    call CocActionAsync('showIncomingCalls')
  else
    call coc#window#close(winid)
  endif
endfunction

function! s:toggle_diagnostics() abort
    let location_list_open = get(getloclist(0, {'winid':0}), 'winid', 0)
    if location_list_open
        lclose
    else
        CocDiagnostics
    endif
endfunction

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : <SID>check_backspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>1 :CocCommand explorer<CR>
nnoremap <silent> <leader>4 :call <SID>toggle_diagnostics()<CR>

nnoremap <silent> <leader>fa <Plug>(coc-codeaction)
nnoremap <silent> <leader>fd :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>fh :call <SID>toggle_call_hierarchy()<CR>
nnoremap <silent> <leader>ft :call <SID>toggle_outline()<CR>

nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>qf <Plug>(coc-fix-current)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)


" configure LeaderF
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShowDevIcons = 0
let g:Lf_CursorBlink = 0

let g:Lf_WildIgnore = {}
let g:Lf_WildIgnore["dir"] = ['.svn','.git','.hg']
let g:Lf_WildIgnore["file"] = ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']

let g:Lf_MruWildIgnore = {}
let g:Lf_MruWildIgnore["dir"] = ['.svn','.git','.hg']
let g:Lf_MruWildIgnore["file"] = ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']

nnoremap <silent> <leader>p :LeaderfBufTag<CR>
" need trailing space
nnoremap <leader>g :Leaderf rg --stayOpen -S -e 


" configure vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-l>'
let g:VM_maps["Add Cursor Up"] = '<C-h>'
let g:VM_mouse_mappings = 1
let g:VM_show_warnings = 0


" configure gruvbox_material
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_diagnostic_text_highlight=1
colorscheme gruvbox-material
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

