"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    
    use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
    use { 'neoclide/coc.nvim', branch = 'release' } 
    use 'honza/vim-snippets'
    use 'kevinhwang91/nvim-bqf'
    
    use 'Raimondi/delimitMate'
    use 'mg979/vim-visual-multi'
    use 'preservim/nerdcommenter'
    use 'phaazon/hop.nvim' 
    
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'wellle/targets.vim'
    
    use 'sainnhe/gruvbox-material'
    use 'itchyny/lightline.vim'
    use 'josa42/vim-lightline-coc'
    use 'mengelbrecht/lightline-bufferline'
end)
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets
syntax on

set termguicolors

set background=light

set encoding=utf-8

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

set showcmd
set wildmode=full
set noshowmode
set cmdheight=2
set laststatus=2
set helplang=cn
set sidescroll=10
set showtabline=2

set formatoptions-=t
set completeopt-=preview
set shortmess+=c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hosts
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '/usr/local/opt/ruby/bin/ruby'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" common maps
let mapleader = " "

nnoremap <silent><leader>s :w<CR>
nnoremap <silent><leader>l :noh<CR>

nnoremap <silent>[b :bprevious<CR>
nnoremap <silent>]b :bnext<CR>

inoremap jk <Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype proto setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.fish set ft=fish
autocmd BufNewFile,BufRead *.swift set ft=swift
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" classic plugins configuration
" configure coc
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

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
nnoremap <silent> <leader>1 :CocCommand explorer<CR>
nnoremap <silent> <leader>4 :CocDiagnostics<CR>
nnoremap <silent> <leader>6 :CocOutline<CR>
nmap <silent> gd :call <SID>go_to_definition()<CR>
nmap <silent> gr :call <SID>go_to_declaration()<CR>
nmap <silent> [n <Plug>(coc-git-prevconflict)
nmap <silent> ]n <Plug>(coc-git-nextconflict)


" config hop.nvim
nmap <silent> <leader>f :HopWord<CR>


" configure LeaderF
nnoremap <silent> <leader>p :LeaderfBufTag<CR>
" need trailing space
nnoremap <leader>g :Leaderf rg --stayOpen --bottom --all-buffers -S -e 
nnoremap <leader><leader>g :Leaderf rg --stayOpen --bottom -S -e 
let g:Lf_ShortcutF = '<C-P>'
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


" Configure vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"] = '<C-k>'
let g:VM_mouse_mappings = 1
let g:VM_show_warnings = 0


" configure nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCustomDelimiters = { 'swift': { 'left': '//' } }


" configure gruvbox_material
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material


" configure lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'
let g:lightline.component_expand = {
            \   'buffers': 'lightline#bufferline#buffers',
            \  }
let g:lightline.component_type = {
            \   'buffers': 'tabsel',
            \ }
let g:lightline.active = {
            \   'left': [
            \     [ 'mode'],
            \     [ 'filename' ],
            \     [ 'readonly' ],
            \     [ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings' ],
            \   ],
            \   'right': [
            \     [ 'lineinfo' ],
            \     [ 'percent' ],
            \     [ 'filetype', 'fileencoding', 'fileformat' ],
            \   ],
            \ }
let g:lightline.tabline = {
            \   'left': [ [ 'buffers' ] ],
            \   'right': [ [ '' ] ]
            \ }
" bufferline
let g:lightline#bufferline#show_number = 1
" coc
let g:lightline#coc#indicator_errors="Error:"
let g:lightline#coc#indicator_warnings="Warning:"
let g:lightline#coc#indicator_info="Info:"
let g:lightline#coc#indicator_hints="Hint:"
call lightline#coc#register()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua plugins configuration
lua <<EOF
-- config nvim-treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
  },
}

require'hop'.setup()
EOF

