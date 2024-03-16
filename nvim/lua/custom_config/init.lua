require("custom_config.packages")
require("custom_config.mappings")
require("custom_config.user_commands")

vim.cmd[[colorscheme dracula]]

vim.opt.termguicolors = true
vim.opt.number = true

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.ruler = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = false

-- Setting relative numbers
vim.opt.number = true

local numberToogle = vim.api.nvim_create_augroup('NumberToggle', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd(
  {"BufEnter", "InsertLeave", "FocusGained"},
  {
    group = numberToogle,
    pattern = "*",
    callback = function()
      vim.api.nvim_win_set_option(0, 'relativenumber', true)
    end
  }
)
autocmd(
  {"BufLeave", "InsertEnter", "FocusLost"},
  {
    group = numberToogle,
    pattern = "*",
    callback = function()
      vim.api.nvim_win_set_option(0, 'relativenumber', false)
    end
  }
)
