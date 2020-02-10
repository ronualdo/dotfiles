" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
" Plug 'cloudhead/neovim-fuzzy'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'slashmili/alchemist.vim'
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

" Automatically format elixir on saving
let g:mix_format_on_save = 1
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

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

" ctrlp config
let g:ctrlp_cmd = 'CtrlPMixed'

" config git editor
"if has('nvim')
"  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
"endif
"autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete 

" neomake config
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_python_enabled_makers=['flake8']
let g:neomake_ruby_enabled_makers=['rubocop', 'reek', 'mri']
let g:neomake_elixir_enabled_makers = ['elixir']

" Mappings
noremap <F2> :NERDTreeToggle<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
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
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>
tnoremap <C-o> <C-\><C-n>
" easy pane navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:docker_compose_proj_mapping = {'micro-service-portal': 'portal'}

" my functions
function! DockerComposeTransform(cmd) abort
  let l:root_folder = get(split(getcwd(), '/'), -1, '')

  if empty(glob('docker-compose.yml'))
    return a:cmd
  else
    return "docker-compose exec ". get(g:docker_compose_proj_mapping, l:root_folder, '') . ' '. a:cmd
  endif
endfunction

let g:test#custom_transformations = {'docker_compose': function('DockerComposeTransform')}
let g:test#transformation = 'docker_compose'
