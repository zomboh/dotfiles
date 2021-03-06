" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map <leader>/ <Plug>(incsearch-easymotion-/)
map <leader>? <Plug>(incsearch-easymotion-?)
map <leader>g/ <Plug>(incsearch-easymotion-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" Toggle line wrap
map <M-z> :set wrap!<CR>

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" Deoplete
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Function shortcuts
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
nnoremap <silent> <C-z> :call ZoomToggle()<CR>
nmap <leader>= :call Preserve("normal gg=G")<CR>

" Split shortcuts
nmap         <C-w>-      :rightb new<CR>
nmap         <C-w>\|     :vnew<CR>
nmap         <C-w>t      :tabnew<CR>
nmap         <C-w><C-h>  :tabprevious<CR>
nmap         <C-w><C-l>  :tabnext<CR>
nmap         <C-w><S-h>  :vertical res -5<CR>
nmap         <C-w><S-j>  :res +5<CR>
nmap         <C-w><S-k>  :res -5<CR>
nmap         <C-w><S-l>  :vertical res +5<CR>
