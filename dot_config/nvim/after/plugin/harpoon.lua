local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ea', mark.add_file)
vim.keymap.set('n', '<leader>ee', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>e1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>e2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>e3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>e4', function() ui.nav_file(4) end)

