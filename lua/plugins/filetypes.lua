return {
	{
		'fatih/vim-go',
		ft = { 'go', 'gomod', 'gosum', 'gohtmltmpl' },
		cmd = { 'GoCoverageToggle', 'GoInstallBinaries', 'GoUpdateBinaries' },
		keys = { { '<leader>`', '<cmd>GoCoverageToggle<cr>' } },
		build = function()
			vim.cmd('GoInstallBinaries')
			vim.cmd('GoUpdateBinaries')
		end,
		init = function()
			vim.g.go_fmt_command = 'goimports'
			--vim.g.go_fmt_options '-s'
			vim.g.go_version_warning = 0
			vim.g.go_rename_command = 'gopls'
		end,
	},
	{ 'rust-lang/rust.vim', ft = 'rust' },
	{ 'cespare/vim-toml',   ft = 'toml' },
	{
		'prettier/vim-prettier',
		build = 'npm install',
		cmd = 'Prettier',
		init = function()
			vim.g['prettier#config#print_width'] = 80
			vim.g['prettier#config#tab_width'] = 2
			vim.g['prettier#config#use_tabs'] = true
			vim.g['prettier#config#semi'] = false
			vim.g['prettier#config#single_quote'] = true
			vim.g['prettier#config#bracket_spacing'] = true
			vim.g['prettier#config#jsx_bracket_same_line'] = false
			vim.g['prettier#config#arrow_parens'] = 'always'
			vim.g['prettier#config#trailing_comma'] = 'all'
			vim.g['prettier#config#parser'] = 'babylon'
			vim.g['prettier#config#config_precedence'] = 'prefer-file'
			vim.g['prettier#config#prose_wrap'] = 'preserve'
		end,
	},
	{ 'pangloss/vim-javascript',     ft = { 'javascript', 'javascript.jsx' } },
	{ 'mxw/vim-jsx',                 ft = 'javascript.jsx' },
	{ 'DeedleFake/vim-wdte',         ft = 'wdte' },
	{ 'jparise/vim-graphql',         ft = 'graphql' },
	{ 'LnL7/vim-nix',                ft = 'nix' },
	{ 'udalov/kotlin-vim',           ft = 'kotlin' },
	{ 'leafgarland/typescript-vim',  ft = { 'typescript', 'typescriptreact' } },
	{ 'peitalin/vim-jsx-typescript', ft = 'typescriptreact' },
	{ 'Quramy/tsuquyomi',            ft = { 'typescript', 'typescriptreact' } },
	{ 'tikhomirov/vim-glsl',         ft = 'glsl' },
	{ 'hashivim/vim-terraform',      ft = 'terraform' },
	{ 'evanleck/vim-svelte',         ft = 'svelte' },
	{ 'weakish/rcshell.vim',         ft = 'rc' },
	{ 'DeedleFake/mkfile.vim',       ft = 'mkfile' },
	{ 'joerdav/templ.vim',           ft = 'templ' },
	{ 'elixir-editors/vim-elixir',   ft = 'elixir' },
	{ 'gleam-lang/gleam.vim',        ft = 'gleam' },
	{ 'ChrisWellsWood/roc.vim',      ft = 'roc' },
}
