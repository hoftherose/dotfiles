vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use ({ 'kevinhwang91/rnvimr', {run = 'make sync'} })
	use ({
		'kdheepak/lazygit.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	})
	use ({
		'crnvl96/lazydocker.nvim',
		config = function()
			require('lazydocker').setup()
		end,
		requires = {
			'MunifTanjim/nui.nvim'
		},
	})

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}
	use { 'scottmckendry/cyberdream.nvim' }
	use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
	use { 'theprimeagen/harpoon' }
	use { 'mbbill/undotree' }
	use {
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	}
	use { 'holy-tech/k9s.nvim' }
	use {
		'max397574/better-escape.nvim',
		config = function()
			require("better_escape").setup()
		end,
	}
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns").setup()
		end,
	}
end)
