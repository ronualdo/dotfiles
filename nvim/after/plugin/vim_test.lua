-- mappings

vim.keymap.set('n', '<leader>vtn', ':TestNearest<CR>', {
  silent=true,
  desc='Run nearest test'
})
vim.keymap.set('n', '<leader>vtf', ':TestFile<CR>', {
  silent=true,
  desc='Run test file'
})
vim.keymap.set('n', '<leader>vta', ':TesSuite<CR>', {
  silent=true,
  desc='Run all tests'
})
vim.keymap.set('n', '<leader>vtl', ':TestLast<CR>', {
  silent=true,
  desc='Run last test'
})
vim.keymap.set('n', '<leader>vtg', ':TestVisit<CR>', {
  silent=true,
  desc='Visit last run test'
})

vim.api.nvim_set_var('test#strategy', 'dispatch')
