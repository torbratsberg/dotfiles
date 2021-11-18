-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'ultisnips'},
	}
})

-- Set up LSP servers
local lsp_servers = {
	'intelephense',
	'tsserver',
	'pyright',
	'cssls',
	'gopls',
	'vuels'
}

local lsp_config = require('lspconfig')
for _, lsp in pairs(lsp_servers) do
	lsp_config[lsp].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

