" plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'danro/rename.vim'
Plug 'duggiefresh/vim-easydir'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'matze/vim-move'

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

" colors
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set termguicolors
syntax enable
colorscheme monokaish

" ctrlP
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
endfunction

function BrightHighlightOff()
  hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#222222 gui=NONE
endfunction

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
