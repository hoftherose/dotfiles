local toggleterm = require("toggleterm")

vim.keymap.set('n', '<leader>et', toggleterm.toggle, {})
vim.keymap.set('n', '<C-T>', toggleterm.toggle, {})
vim.keymap.set('t', '<C-T>', toggleterm.toggle, {})

