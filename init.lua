vim.call('plug#begin')
require('plug')
vim.call('plug#end')

if vim.env['TERM'] == 'screen' then
	vim.env['TERM'] = 'xterm-256'
end
