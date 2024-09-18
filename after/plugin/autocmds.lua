vim.api.nvim_create_autocmd('BufReadPost', {
	callback = function(ev)
		vim.opt_local.fo:remove {'r', 'o', 'c'}
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev)
		vim.opt_local.fo:remove {'r', 'o', 'c'}
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'python',
	callback = function(ev)
		vim.opt_local.ts = 4
		vim.opt_local.sw = 4
		vim.opt_local.et = true
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'ruby',
	callback = function(ev)
		vim.opt_local.ts = 2
		vim.opt_local.sw = 2
		vim.opt_local.et = false
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = {'text', 'markdown'},
	callback = function(ev)
		vim.opt_local.spell = true
	end,
})
