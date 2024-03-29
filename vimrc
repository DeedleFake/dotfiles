if !has('win32')
	set shell=bash
endif

call plug#begin()

Plug 'tpope/vim-sensible'

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'Shougo/vimproc.vim', {'do': ':VimProcInstall' }

" Syntaxes and Filetypes
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'} ", 'tag': '*'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'DeedleFake/vim-wdte'
Plug 'jparise/vim-graphql'
Plug 'LnL7/vim-nix'
Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
Plug 'tikhomirov/vim-glsl'
Plug 'hashivim/vim-terraform'
Plug 'evanleck/vim-svelte'
Plug 'weakish/rcshell.vim'
Plug 'DeedleFake/mkfile.vim'
Plug 'joerdav/templ.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'gleam-lang/gleam.vim'

" Colorschemes
Plug 'tpope/vim-vividchalk'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'hzchirs/vim-material'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

Plug 'mbbill/undotree'

if has('nvim')
	Plug 'neovim/nvim-lspconfig'
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': ':COQdeps'}
endif

call plug#end()

runtime! plugin/sensible.vim

filetype plugin indent on
syntax on

set ts=2 sw=2 noet
set ignorecase
set background=dark
set showcmd
set number
set scrolloff=6
set hlsearch
set nottimeout
set encoding=utf-8
set relativenumber

let &directory = split(&rtp, ',')[0] . '/swap,' . &directory

let g:go_fmt_command = 'goimports'
"let g:go_fmt_options = '-s'
let g:go_version_warning = 0
let g:go_rename_command = 'gopls'

let g:prettier#config#print_width = 80 " 80
let g:prettier#config#tab_width = 2 " 2
let g:prettier#config#use_tabs = 'true' " fale
let g:prettier#config#semi = 'false' " true
let g:prettier#config#single_quote = 'true' " false
let g:prettier#config#bracket_spacing = 'true' " true
let g:prettier#config#jsx_bracket_same_line = 'false' " false
let g:prettier#config#arrow_parens = 'always' " avoid
let g:prettier#config#trailing_comma = 'all' " none
let g:prettier#config#parser = 'flow' " babylon
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'

let g:flow#autoclose = 1

let g:javascript_plugin_flow = 1

let g:instant_markdown_autostart = 0

let g:jsdoc_enable_es6 = 1

let g:enable_bold_font = 1
let g:enable_italic_font = 1

"if !has('macunix') && !has('gui_running')
"	let g:hybrid_transparent_background = 1
"endif

colorscheme seoul256

let g:airline_theme = "deus"
"let g:airline_powerline_fonts = 1

nmap <Leader>t :FZF<CR>

nmap <F6> :UndotreeToggle<CR>
nmap <F7> :GoCoverageToggle<CR>
nmap <F8> :IndentGuidesToggle<CR>

nmap J gT
nmap K gt

if $TERM == "screen"
	let $TERM = "xterm-256"
endif

if has('nvim')
	let g:coq_settings = {'auto_start': 'shut-up'}

lua << EOF
	local lsp = require 'lspconfig'

	lsp.vimls.setup{}

	lsp.gopls.setup{}
	lsp.ruby_ls.setup{}
	lsp.dartls.setup{}
	lsp.rust_analyzer.setup{}
	lsp.zls.setup{}
	lsp.gleam.setup{}

	lsp.graphql.setup{}

	lsp.html.setup{}
	--lsp.css.setup{}
	lsp.eslint.setup{}
	lsp.svelte.setup{}
	lsp.elixirls.setup{
		cmd = {"/usr/lib/elixir-ls/language_server.sh"};
	}

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<space>f', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end,
	})
EOF
endif

autocmd BufReadPost * setlocal fo-=r fo-=o fo-=c

autocmd FileType * setlocal fo-=r fo-=o fo-=c
autocmd FileType python setlocal ts=4 sw=4 et
autocmd FileType ruby setlocal ts=2 sw=2 noet
autocmd FileType text,markdown setlocal spell

if has('gui_running')
	set lines=40 columns=80
	set guioptions-=m guioptions-=T
	"colorscheme vividchalk
	"colorscheme vim-material

	if has('gui_win32')
		set guifont=Go_Mono:h10:cANSI:qDRAFT
	endif
endif
