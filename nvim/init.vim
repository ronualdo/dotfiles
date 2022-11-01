" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'slashmili/alchemist.vim' " do I need this?
Plug 'junegunn/fzf', { 'do': '~/.fzf/bin/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-mix-format'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'eugen0329/vim-esearch'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'brettanomyces/nvim-editcommand'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-ruby/vim-ruby'
call plug#end()

" set colours
set termguicolors

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" setup nvim-editcommand
" It is not working when we try to open another pane
" default mapping <c-x><c-e>
"let g:editcommand_prompt = '▶'
"tmap <c-v> <Plug>EditCommand

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set ruler

" setting split openning
set splitbelow
set splitright

" general editor settings
colo dracula
syntax on
filetype plugin indent on
set nohlsearch
set foldmethod=syntax
set nofoldenable

" setting line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" column limit config
highlight ColorColumn ctermbg=16
call matchadd('ColorColumn', '\%91v', 100)

" Adjusting vimdiff
highlight! link DiffText Todo

let g:coc_global_extensions = [ 'coc-solargraph' ]

" Mappings
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
tnoremap <Esc> <C-\><C-n>
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" easy pane navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fg :Files<CR>
nnoremap <leader>spc :sp term://zsh<CR>i
nnoremap <leader>ttn :tabnew<CR>
nnoremap <leader>ttc :tabnew term://zsh<CR>i
nnoremap <leader>vsc :vsp term://zsh<CR>i

" test snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
