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
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' },
	}, {
		{ name = 'buffer' },
	})
})

-- Set up LSP servers
local lsp_servers = {
	'tsserver',     -- `npm i -g typescript typescript-language-server`
	'gopls',        -- `go install golang.org/x/tools/gopls@latest`
	'cssls',        -- `npm i -g vscode-langservers-extracted`
	'jsonls',       -- `npm i -g vscode-langservers-extracted`
	'intelephense', -- `npm install -g intelephense`
	'pyright',      -- `npm i -g pyright`
	'vuels',        -- `npm i -g vls`
	'rust_analyzer',
}

local lsp_config = require('lspconfig')
for _, lsp in pairs(lsp_servers) do
	lsp_config[lsp].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

