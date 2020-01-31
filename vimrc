if !has('win32')
	set shell=bash
endif

call plug#begin()

Plug 'tpope/vim-sensible'

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'kien/ctrlp.vim', {'on': 'CtrlP'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
"Plug 'suan/vim-instant-markdown', {'on': 'InstantMarkdownPreview'}
Plug 'shime/vim-livedown', {'on': 'LivedownToggle'}
"Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}

" Syntaxes and Filetypes
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
"Plug 'tpope/vim-scriptease'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {'do': 'npm install'}
"Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc', {'on': 'JsDoc'}
Plug 'DeedleFake/vim-wdte'
Plug 'jparise/vim-graphql'
Plug 'LnL7/vim-nix'
Plug 'udalov/kotlin-vim'

" Colorschemes
"Plug 'tpope/vim-vividchalk'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'hzchirs/vim-material'

if !has('nvim')
	Plug 'sjl/gundo.vim'
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

"let g:indent_guides_enable_on_vim_startup = 1

let g:enable_bold_font = 1
let g:enable_italic_font = 1

"if !has('macunix') && !has('gui_running')
"	let g:hybrid_transparent_background = 1
"endif
"
"colorscheme hybrid_material

let g:airline_theme = "deus"
"let g:airline_powerline_fonts = 1

nmap <F5> :NERDTreeToggle<CR>
nmap <C-P> :CtrlP<CR>

nmap <F7> :GoCoverageToggle<CR>
nmap <F8> :IndentGuidesToggle<CR>

nmap J gT
nmap K gt

if $TERM == "screen"
	let $TERM = "xterm-256"
endif

if !has('nvim')
	nmap <F6> :GundoToggle<CR>
endif

"function OmniMap()
"	if &omnifunc
"		inoremap <buffer> <silent> . .<C-X><C-O>
"	endif
"endfunction

"autocmd BufReadPost * call OmniMap()

autocmd BufReadPost * setlocal fo-=r fo-=o fo-=c

autocmd FileType * setlocal fo-=r fo-=o fo-=c
autocmd FileType python setlocal ts=4 sw=4 et
autocmd FileType rust setlocal ts=2 sw=2 noet
autocmd FileType text,markdown setlocal spell

if has('gui_running')
	set lines=40 columns=80
	set guioptions-=m guioptions-=T
	"colorscheme vividchalk
	colorscheme vim-material

	if has('gui_win32')
		set guifont=Go_Mono:h10:cANSI:qDRAFT
	endif
endif
