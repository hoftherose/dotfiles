vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use ({ 'wbthomason/packer.nvim' })
	use ({ 'kevinhwang91/rnvimr', run = 'make sync' }) -- er + terminal shortcuts + ranger shortcuts TODO (Configure)
	use ({
		'kdheepak/lazygit.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}) -- lg + terminal shortcuts + lazygit shortcuts TODO (Configure)
	use ({
		'crnvl96/lazydocker.nvim',
		config = function()
			require('lazydocker').setup()
		end,
		requires = {
			'MunifTanjim/nui.nvim'
		},
	}) -- ld + terminal shortcuts + lazydocker shortcuts TODO (Configure)
	use ({ 'holy-tech/k9s.nvim' }) -- lk + terminal shortcuts + k9s shortcuts TODO (replace/Configure)
	use ({
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}) -- sf (find) sF (find files) sg (find git)
	use ({ 'scottmckendry/cyberdream.nvim' })
	use ({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use ({ 'theprimeagen/harpoon' }) -- ee/ea/e#
	use ({ 'mbbill/undotree' }) -- tu
	use ({
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	}) -- TODO (configure)
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
	}) -- TODO (configure)
	use ({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}) -- TODO (configure document)
    use ({'williamboman/mason.nvim'}) -- TODO (configure-setup)
    use ({'williamboman/mason-lspconfig.nvim'})
    use ({
       'kylechui/nvim-surround',
       tag = '*',
       config = function()
           require('nvim-surround').setup({})
       end
    }) -- ysiw" ysi" ys$" cs'" ds" dsf (function calls)
    use ({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
                dot_repeat = false,
            })
        end
    }) -- <leader>j (join) <leader>s (split)
    use ({ 'f-person/git-blame.nvim' })
    use ({
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function()
            require('toggleterm').setup()
        end
    }) -- et (TODO Replace)
    use ({ 'terryma/vim-multiple-cursors' }) -- v mode C-n
    use ({ 'tpope/vim-commentary' }) -- gcc toggle comments TODO change to mc
    use ({ 'preservim/tagbar' }) -- tt
    use ({
        'neoclide/coc.nvim',
        branch = 'release',
    }) -- TODO config
end)
