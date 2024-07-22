require('gitsigns').setup({
    sign_priority=100
})

vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gP", "<cmd>Gitsigns preview_hunk_inline<CR>", {})
vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_lint_blame<CR>", {})
vim.keymap.set("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", {})
vim.keymap.set("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", {})
