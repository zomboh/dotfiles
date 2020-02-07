" plugins
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
Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" general stuff
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

" tabs vs spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" clipboard
if has('clipboard')
    set clipboard=unnamed,unnamedplus
endif

" invisible chars
set listchars=tab:▸-,trail:·,nbsp:·,space:·,extends:>,precedes:<
set list

" autocompletion
set omnifunc=syntaxcomplete#Complete

" colors

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

" ag should be fast enough to not need to use caching
let g:ctrlp_use_caching = 0

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" emmet
let g:user_emmet_leader_key='<C-w>'

" UltiSnips
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

source ~/.config/nvim/mappings.vim
