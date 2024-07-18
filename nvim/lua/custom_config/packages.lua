local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Git integration
fugitive = "tpope/vim-fugitive"

-- LSP, Linters, etc package manager
mason = "williamboman/mason.nvim"

-- lsp integration/config
lsp_config = "neovim/nvim-lspconfig"

mason_lsp_config = "williamboman/mason-lspconfig.nvim"

cmp_nvim = "hrsh7th/nvim-cmp"

cmp_nvim_lsp = "hrsh7th/cmp-nvim-lsp"

-- syntax parsing used to language highlight,
-- folding, etc
nvim_tree_sitter = {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

-- Color Theme
dracula_ui = {"dracula/vim", name = "dracula" }

-- Fuzzy finder
telescope = {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' }
}

-- optional telescope dependency
telescope_fzf_native = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }

-- close end blocks for ruby
nvim_tree_sitter_endwise = "RRethy/nvim-treesitter-endwise"

-- tmux + nvim movement integration/mappings
tmux_navigator = "christoomey/vim-tmux-navigator"

-- cmp autocompletion
cmp = {'hrsh7th/nvim-cmp'}         -- Required

-- cmp lsp integration
cmp_nvim_lsp = {'hrsh7th/cmp-nvim-lsp'}

-- slim syntax highlight since treesitter does not support it yet
vim_slim = "slim-template/vim-slim"

-- statusline
lightline = "itchyny/lightline.vim"

-- vim test
vim_test = "vim-test/vim-test"

dispatch = "tpope/vim-dispatch"

emmet = "mattn/emmet-vim"

require("lazy").setup({
  cmp,
  cmp_nvim,
  cmp_nvim_lsp,
  dispatch,
  dracula_ui,
  emmet,
  fugitive,
  lightline,
  lsp_config,
  mason,
  mason_lsp_config,
  nvim_tree_sitter,
  nvim_tree_sitter_endwise,
  telescope,
  telescope_fzf_native,
  tmux_navigator,
  vim_slim,
  vim_test
})

