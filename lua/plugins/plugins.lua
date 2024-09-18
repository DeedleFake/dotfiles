return {
	{'tpope/vim-sensible'},

	{'tpope/vim-fugitive'},
	{
		'vim-airline/vim-airline',
		init = function()
			vim.g.airline_theme = "deus"
			--vim.g.airline_powerline_fonts = 2
		end,
	},
	{'vim-airline/vim-airline-themes'},
	{'easymotion/vim-easymotion'},

	{
		'junegunn/fzf',
		cmd = {'FZF'},
		keys = {{'<leader>t', '<cmd>FZF<cr>'}},
		config = function() vim.call('fzf#install') end,
	},

	{
		'mbbill/undotree',
		cmd = {'UndotreeToggle'},
		keys = {{'<F6>', '<cmd>UndotreeToggle<cr>'}},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = true },

			--incremental_selection = {
			--	enable = true,
			--	keymaps = {
			--		init_selection = "gnn", -- set to `false` to disable one of the mappings
			--		node_incremental = "grn",
			--		scope_incremental = "grc",
			--		node_decremental = "grm",
			--	},
			--},
		},
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	},
	{'williamboman/mason.nvim'},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {'neovim/nvim-lspconfig'},
		config = function()
			require('mason').setup {}
			require("mason-lspconfig").setup_handlers {
				function(server_name)
					require("lspconfig")[server_name].setup {}
				end,

				-- Example of manual configuration for a specific server:
				-- ["example_server"] = function()
				-- 	require("lspconfig").example_server.setup {}
				-- end,
			}
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
		},
		config = function()
			local cmp = require('cmp')

			cmp.setup {
				mapping = cmp.mapping.preset.insert {
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-c>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm { select = false },
					['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
					['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
				},

				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'buffer' },
				})
			}
		end,
	},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
}
