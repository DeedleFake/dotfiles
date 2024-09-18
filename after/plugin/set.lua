vim.cmd('runtime! plugin/sensible.vim')

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

vim.cmd('colorscheme seoul256')

if not vim.fn.has('win32') then
	vim.opt.shell = 'bash'
end

if vim.fn.has('gui_running') ~= 0 then
	vim.opt.lines = 40
	vim.opt.columns = 80
	vim.opt.guioptions:remove {'m', 'T'}
	--colorscheme vividchalk
	--colorscheme vim-material

	if vim.fn.has('gui_win32') then
		vim.opt.guifont = 'Go_Mono:h10:cANSI:qDRAFT'
	end
end
