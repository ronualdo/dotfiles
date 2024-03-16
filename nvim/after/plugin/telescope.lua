local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>ff', function() builtin.find_files(themes.get_ivy({})) end, {})
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(themes.get_ivy({})) end, {})
vim.keymap.set('n', '<leader>fb', function() builtin.buffers(themes.get_ivy({})) end, {})
vim.keymap.set('n', '<leader>fh', function() builtin.help_tags(themes.get_ivy({})) end, {})
