" Plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'danro/rename.vim'
" Plug 'dense-analysis/ale'
Plug 'duggiefresh/vim-easydir'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'epmatsw/ag.vim'
" Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'lambdalisue/suda.vim'
" Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'maximbaz/lightline-ale'
" Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wesQ3/vim-windowswap'
Plug 'Xuyuanp/nerdtree-git-plugin'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" Devicons must always be the last one
Plug 'ryanoasis/vim-devicons'

" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

call plug#end()

" General stuff
set number
set noshowmode
set autoread
set autoindent
set mouse=a
filetype plugin on
set updatetime=100
let mapleader="\<Space>"
set laststatus=2

" UI
set cursorline
set fillchars+=vert:\│
set scrolloff=1
set sidescrolloff=5
set showmatch
set lazyredraw
set ttyfast
set splitbelow
set splitright
set previewheight=15

" Tabs vs spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

" Clipboard
if has('clipboard')
    set clipboard=unnamed,unnamedplus
endif

" Invisible chars
set listchars=tab:▸-,trail:·,nbsp:·,space:·,extends:>,precedes:<
set list

" Autocompletion
set omnifunc=syntaxcomplete#Complete

" Colors

" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
set termguicolors
syntax enable
colorscheme monokaish

" ctrlP
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function! BrightHighlightOn()
  hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
endfunction

function! BrightHighlightOff()
  hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#222222 gui=NONE
endfunction

let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:40'
let g:ctrlp_max_depth = 20
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_status_func = {
    \ 'main': 'CtrlPStatusMain',
    \ 'prog': 'CtrlPStatusProg',
\ }
let g:ctrlp_funky_syntax_highlight = 1

" Ag should be fast enough to not need to use caching
let g:ctrlp_use_caching = 0

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" Emmet
let g:user_emmet_leader_key='<C-w>'

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Suda
let g:suda_smart_edit = 1

" NERDTree
let g:NERDTreeIgnore=['node_modules']

" Lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ }
\ }

" LSP stuff

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

" Avoid showing extra messages when using completion
set shortmess+=c


" Configure lsp
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({
    capabilities=capabilities,
    on_attach=on_attach,
})

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Quick-fix
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Completion
lua <<EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

source ~/.config/nvim/functions.vim
source ~/.config/nvim/mappings.vim
