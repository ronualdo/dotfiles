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

avante = {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- provider = "local-deepseek",
    -- vendors = {
    --   ["local-deepseek"] = {
    --     __inherited_from = 'openai',
    --     endpoint = "http://127.0.0.1:11434/v1",
    --     -- model = 'deepseek/deepseek-r1',
    --     model = 'deepseek-r1:7b',
    --     disable_tools = true
    --   }
    -- }
    debug = true,
    provider = "ollama",
    ollama = {
      model = "deepseek-coder:6.7b"
    }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

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

luasnip = "L3MON4D3/LuaSnip"

cmp_luasnip = "saadparwaiz1/cmp_luasnip"

require("lazy").setup({
  avante,
  cmp,
  cmp_luasnip,
  cmp_nvim,
  cmp_nvim_lsp,
  dispatch,
  dracula_ui,
  emmet,
  fugitive,
  lightline,
  lsp_config,
  luasnip,
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

