-- Initiate Treesitter
require'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true
	},
	indent = {
		enable = true,
	}
}

-- Telescope configs
require('telescope').setup{
	defaults = {
		file_ignore_patterns = {'%.png', '%.otf', '%.jpg', '%.jpeg', '%.woff', '%.woff2', '%.ttf', '%.eot', '%.map', 'build/*', '%.po', '%.mo'},
		file_sorter = require('telescope.sorters').get_fzy_sorter,
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	}
}

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

-- Setup lspconfig.
require('lspconfig')['tsserver'].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig')['cssls'].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig')['intelephense'].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig')['pyright'].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig')['gopls'].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig')['vuels'].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
