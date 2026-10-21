local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>sf', function()
    builtin.find_files({ find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } })
end, {})
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
vim.keymap.set('n', '<leader>sF', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- make sure ripgrep is installed
end)

