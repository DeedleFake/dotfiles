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

vim.api.nvim_create_autocmd('BufReadPost', {
	callback = function(ev)
		vim.opt_local.fo:remove { 'r', 'o', 'c' }
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev)
		vim.opt_local.fo:remove { 'r', 'o', 'c' }
		pcall(vim.treesitter.start, ev.buf)
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
	pattern = { 'text', 'markdown' },
	callback = function(ev)
		vim.opt_local.spell = true
	end,
})
