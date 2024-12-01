vim.cmd('runtime! plugin/sensible.vim')

require('seoul256')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.et = false
vim.opt.ignorecase = true
vim.opt.background = 'dark'
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.scrolloff = 6
vim.opt.hlsearch = true
vim.opt.ttimeout = false
vim.opt.encoding = 'utf-8'
vim.opt.relativenumber = true

vim.g.instant_markdown_autostart = 0

vim.g.jsdoc_enable_es6 = 1

vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1

--vim.keymap.set('n', '<F8>', '<cmd>IndentGuidesToggle<cr>')

vim.keymap.set('n', 'J', '')

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

if not vim.fn.has('win32') then
	vim.opt.shell = 'bash'
end

if vim.fn.has('gui_running') ~= 0 then
	vim.opt.lines = 40
	vim.opt.columns = 80
	vim.opt.guioptions:remove { 'm', 'T' }
	--colorscheme vividchalk
	--colorscheme vim-material

	if vim.fn.has('gui_win32') then
		vim.opt.guifont = 'Go_Mono:h10:cANSI:qDRAFT'
	end
end
