local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>sF', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
vim.keymap.set('n', '<leader>sf', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

