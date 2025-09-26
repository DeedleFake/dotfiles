return {
	{ 'tpope/vim-sensible' },

	--{
	--	'vim-airline/vim-airline',
	--	dependencies = { 'vim-airline/vim-airline-themes' },
	--	init = function()
	--		vim.g.airline_theme = "deus"
	--		--vim.g.airline_powerline_fonts = 2
	--	end,
	--},
	--{ 'vim-airline/vim-airline-themes' },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = { theme = 'auto' },
			sections = {
				lualine_b = { 'branch', 'diff', {
					'diagnostics',
					sources = { 'nvim_lsp', 'nvim_diagnostic' },
					update_in_insert = true,
					always_visible = true,
				} },
			},
		},
	},

	{ 'easymotion/vim-easymotion', keys = { '<leader><leader>' } },

	{
		'ibhagwan/fzf-lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		keys = { { '<leader>t', function() require('fzf-lua').files() end } },
		opts = { 'fzf-vim' },
	},

	{
		'mbbill/undotree',
		cmd = { 'UndotreeToggle' },
		keys = { { '<F6>', '<cmd>UndotreeToggle<cr>' } },
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			vim.cmd('TSInstall all')
			vim.cmd('TSUpdate all')
		end,
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = { enable = false },

				--incremental_selection = {
				--	enable = true,
				--	keymaps = {
				--		init_selection = "gnn", -- set to `false` to disable one of the mappings
				--		node_incremental = "grn",
				--		scope_incremental = "grc",
				--		node_decremental = "grm",
				--	},
				--},
			}
		end,
	},

	{
		'mhartington/formatter.nvim',
		cmd = { 'Format', 'FormatWrite' },
		dependencies = {
			'mason-org/mason.nvim',
			'mason-org/mason-lspconfig.nvim',
		},
		config = function()
			require('formatter').setup {
				filetype = {
					markdown = { require('formatter.filetypes.markdown').prettier },
					eruby = {
						function()
							local config = require('formatter.filetypes.eruby').erbformatter()
							config.exe = 'erb-format'
							return config
						end,
					},
					html = { require('formatter.filetypes.html').prettier },
					css = { require('formatter.filetypes.css').prettier },
				},
			}
		end,
	},

	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspStart', 'LspRestart', 'LspStop', 'LspLog' },
		event = { 'BufNewFile', 'BufReadPre', 'FilterReadPre', 'FileReadPre' },
		dependencies = {
			'mason-org/mason.nvim',
			'mason-org/mason-lspconfig.nvim',
		},
		config = function()
			vim.lsp.config('roc_ls', {
				cmd = { "roc_language_server" },
				filetypes = { "roc" },
				single_file_support = true,
			})
		end,
	},
	{
		'mason-org/mason.nvim',
		dependencies = { 'mason-org/mason-lspconfig.nvim' },
		cmd = { 'Mason' },
		keys = { { '<F7>', '<cmd>Mason<cr>' } },
	},
	{
		'mason-org/mason-lspconfig.nvim',
		lazy = true,
		dependencies = { 'neovim/nvim-lspconfig' },
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			vim.lsp.config('*', { capabilities = capabilities })

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = {
								'vim',
								'require',
							},
						},
					},
				},
			})

			vim.lsp.config('ruby_lsp', {
				cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv('GLOBAL_GEMFILE') },
			})

			do
				local filetypes = vim.lsp.config.html.filetypes
				table.insert(filetypes, 'eruby')
				table.insert(filetypes, 'svelte')
				vim.lsp.config('html', { filetypes = filetypes })
			end

			do
				local filetypes = vim.lsp.config.tailwindcss.filetypes
				table.insert(filetypes, 'eruby')
				vim.lsp.config('tailwindcss', { filetypes = filetypes })
			end

			require('mason').setup {}
			require("mason-lspconfig").setup {}
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
				preselect = cmp.PreselectMode.None,

				mapping = cmp.mapping.preset.insert {
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-c>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm { select = false },
					['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
					['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
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
	{
		'hrsh7th/cmp-nvim-lsp',
		lazy = true,
		dependencies = { 'neovim/nvim-lspconfig' },
	},
	{ 'hrsh7th/cmp-buffer',  lazy = true },
	{ 'hrsh7th/cmp-path',    lazy = true },
	{ 'hrsh7th/cmp-cmdline', lazy = true },
}
