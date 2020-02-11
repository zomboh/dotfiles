" Plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'blueyed/smarty.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'danro/rename.vim'
Plug 'duggiefresh/vim-easydir'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'epmatsw/ag.vim'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'lambdalisue/suda.vim'
Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

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

let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

" ctrlP
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
endfunction

function BrightHighlightOff()
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

" UltiSnips
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Suda
let g:suda_smart_edit = 1

source ~/.config/nvim/mappings.vim
