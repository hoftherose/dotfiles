vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use ({ 'kevinhwang91/rnvimr', {run = 'make sync'} })
	use ({
		'kdheepak/lazygit.nvim',
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

end)
