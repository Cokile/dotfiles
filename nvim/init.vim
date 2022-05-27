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
      require('gitsigns').setup()
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
      { 'n', '<leader>f' }, { 'n', '<leader><leader>f' }
    },
    config = function()
      require('hop').setup()
      vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require'hop'.hint_char1()<cr>", { silent = true })
      vim.api.nvim_set_keymap('n', '<leader><leader>f', "<cmd>lua require'hop'.hint_char2()<cr>", { silent = true })
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
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
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
set cmdheight=2

set sidescrolloff=5
set scrolloff=5

set formatoptions-=t
set completeopt-=preview
set shortmess+=c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" globals
let g:python3_host_prog = '/usr/local/bin/python3'

let g:do_filetype_lua = 1
let g:did_load_filetypes = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" common maps
let mapleader = " "

nnoremap <silent><leader>s :w<CR>

nnoremap <silent>[b :bprevious<CR>
nnoremap <silent>]b :bnext<CR>

inoremap jk <Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype proto setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd BufNewFile,BufRead *.fish set ft=fish
autocmd BufNewFile,BufRead *.swift set ft=swift
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" classic plugins configuration
" configure coc
let g:coc_global_extensions = [
            \ 'coc-explorer',
            \ 'coc-go',
            \ 'coc-json',
            \ 'coc-pyright',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-solargraph',
            \ 'coc-sourcekit'
            \ ]
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:go_to_definition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

function! s:go_to_declaration()
  if CocAction('jumpDeclaration')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>1 :CocCommand explorer<CR>
nnoremap <silent> <leader>4 :CocDiagnostics<CR>
nnoremap <silent> <leader>6 :CocOutline<CR>
nnoremap <silent> <leader>9 :call <SID>show_documentation()<CR>

nmap <silent> gd :call <SID>go_to_definition()<CR>
nmap <silent> gr :call <SID>go_to_declaration()<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)


" configure LeaderF
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'bottom'
let g:Lf_WindowHeight = 0.22
let g:Lf_ShowDevIcons = 0
let g:Lf_CursorBlink = 0
let g:Lf_Ctags = '/usr/local/bin/ctags'
let g:Lf_DefaultExternalTool = "rg"
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_MruWildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}

nnoremap <silent> <leader>p :LeaderfBufTag<CR>
" need trailing space
nnoremap <leader>g :Leaderf rg --stayOpen -S -e 


" Configure vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"] = '<C-k>'
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

