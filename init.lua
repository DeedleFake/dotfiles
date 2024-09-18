require('lazy_load')

if vim.env['TERM'] == 'screen' then
	vim.env['TERM'] = 'xterm-256'
end

require('set')
require('autocmds')
