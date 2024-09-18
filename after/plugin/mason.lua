require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end,

	-- Example of manual configuration for a specific server:
	-- ["example_server"] = function()
	-- 	require("lspconfig").example_server.setup {}
	-- end,
}
