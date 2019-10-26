"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

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

" Automatically format elixir on saving
let g:mix_format_on_save = 1

" Nerdtree settings
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" deoplete config
let g:deoplete#enable_at_startup = 1

" nerdtree config
let NERDTreeQuitOnOpen=1

" vim-test config
let test#strategy = "neovim"

" neomake config
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers=['standard']
let g:neomake_python_enabled_makers=['flake8']
let g:neomake_ruby_enabled_makers=['rubocop', 'reek', 'mri']

" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'eugen0329/vim-esearch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'cloudhead/neovim-fuzzy'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-mix-format'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Mappings
map <F2> :NERDTreeToggle<CR>
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>
nnoremap <C-p> :FuzzyOpen<CR>
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
" vim-test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
tmap <C-o> <C-\><C-n>
" easy pane navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
