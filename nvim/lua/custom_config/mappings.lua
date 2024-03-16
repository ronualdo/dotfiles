vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {
  silent=true,
  desc="Go to normal mode for terminal"
})

vim.keymap.set('n', '<tab>', ':tabnext<CR>', {
  silent=true,
  desc="Next tab"
})
vim.keymap.set('n', '<S-tab>', ':tabprevious<CR>', {
  silent=true,
  desc="Previous tab"
})

vim.keymap.set('n', '<leader>spc', ':sp term://zsh<CR>i', {
  silent=true,
  desc="Open horizontal terminal"
})
vim.keymap.set('n', '<leader>vsc', ':vsp term://zsh<CR>i', { 
  silent=true,
  desc="Open vertical terminal"
})
vim.keymap.set('n', '<leader>ttc', ':tabnew term://zsh<CR>i', {
  silent=true,
  desc="Open terminal in a new tab"
})
vim.keymap.set('n', '<leader>ttn', ':tabnew<CR>', {
  silent=true,
  desc="Open a new tab"
})

vim.keymap.set('n', '<leader>rvc', ':Vrun bin/rails c -- --noautocomplete<CR>i', {
  silent=true,
  desc="Open rails console in a vertical split tab"
})

vim.keymap.set('n', '<leader>rsc', ':Run bin/rails c -- --noautocomplete<CR>i', {
  silent=true,
  desc="Open rails console in split"
})

vim.keymap.set('n', '<leader>rtc', ':Trun bin/rails c -- --noautocomplete<CR>i', {
  silent=true,
  desc="Open rails console in tab"
})

vim.keymap.set('v', '<leader>y', '"+y', {
  silent=true,
  desc="Copy to SO clipboard"
})
vim.keymap.set('n', '<leader>y', '"+y', {
  silent=true,
  desc="Copy to SO clipboard"
})
