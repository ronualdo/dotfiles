" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'slashmili/alchemist.vim'
Plug 'junegunn/fzf', { 'do': '~/.fzf/bin/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'eugen0329/vim-esearch'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'brettanomyces/nvim-editcommand'
Plug 'sheerun/vim-polyglot'
call plug#end()

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
