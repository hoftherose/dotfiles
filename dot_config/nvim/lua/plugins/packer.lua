vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use ({ 'wbthomason/packer.nvim' })
	use ({ 'kevinhwang91/rnvimr', run = 'make sync' }) -- er + terminal shortcuts + ranger shortcuts
	use ({
		'kdheepak/lazygit.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}) -- lg + terminal shortcuts + lazygit shortcuts
	use ({
		'crnvl96/lazydocker.nvim',
		config = function()
			require('lazydocker').setup()
		end,
		requires = {
			'MunifTanjim/nui.nvim'
		},
	}) -- ld + terminal shortcuts + lazydocker shortcuts
	use ({ 'holy-tech/k9s.nvim' }) -- lk + terminal shortcuts + k9s shortcuts
	use ({
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}) -- s*
	use ({ 'scottmckendry/cyberdream.nvim' })
	use ({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use ({ 'theprimeagen/harpoon' }) -- ee/ea/e#
	use ({ 'mbbill/undotree' }) -- tu
	use ({
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	})
	use ({
		'max397574/better-escape.nvim',
		config = function()
			require('better_escape').setup({
                mappings = {
                    t = {
                        j = {
                            k = false,
                            j = false
                        }
                    }
                }
            })
		end,
	}) -- insert or command mode jj/jk 
	use ({
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	})
	use ({ 'rktjmp/playtime.nvim' })
	use ({
		'epwalsh/obsidian.nvim',
		tag = '*',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('obsidian').setup({
				workspaces = {
					{
						name = 'Psych',
						path = '~/.obsidian/Psych',
					},
					{
						name = 'FabricTesting',
						path = '~/.obsidian/FabricTesting',
					},
				},
			})
		end,
	})
	use ({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	})
    use ({
       'kylechui/nvim-surround',
       tag = '*',
       config = function()
           require('nvim-surround').setup({})
       end
    }) -- ysiw csiw dsiw
    use ({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({})
        end
    })
    use ({ 'f-person/git-blame.nvim' })
    use ({
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function()
            require('toggleterm').setup()
        end
    }) -- et
    use ({ 'terryma/vim-multiple-cursors' }) -- v mode C-n
    use ({ 'tpope/vim-commentary' }) -- gcc toggle comments
    use ({ 'preservim/tagbar' }) -- tt
    use ({ 'neoclide/coc.nvim' })
end)
