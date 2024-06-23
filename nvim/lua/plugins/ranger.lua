vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_edit_cmd = 'drop'
vim.g.rnvimr_draw_border = 0
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_shadow_winblend = 70


vim.g.rnvim_layout = {
	["relative"] = "editor",
	["width"] = vim.fn.float2nr(vim.fn.round(0.7 * vim.api.nvim_win_get_width(0))),
	["height"] = vim.fn.float2nr(vim.fn.round(0.7 * vim.api.nvim_win_get_height(0))),
	["col"] =  vim.fn.float2nr(vim.fn.round(0.15 * vim.api.nvim_win_get_width(0))),
	["row"] = vim.fn.float2nr(vim.fn.round(0.15 * vim.api.nvim_win_get_height(0))),
	["style"] = "minimal",
}
