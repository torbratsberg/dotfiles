-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4, {'i', 'c'}),
        ['<C-u>'] = cmp.mapping.scroll_docs(4, {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'path' },
        { name = 'buffer' },
    })
})

-- Set up LSP servers
local lsp_servers = {
    'ts_ls',        -- `npm i -g typescript typescript-language-server`
    'cssls',        -- `npm i -g vscode-langservers-extracted`
    'somesass_ls',  -- `npm i some-sass-language-server`
    'jsonls',       -- `npm i -g vscode-langservers-extracted`
    'angularls',    -- `npm i -g @angular/language-server`
    'pyright',      -- `npm i -g pyright`
    'csharp_ls',    -- `dotnet tool install --global csharp-ls`
    'gopls',        -- `go install golang.org/x/tools/gopls@latest`
    'svelte'        -- `npm i svelte-language-server`
}

local lsp_config = require('lspconfig')
for _, lsp in pairs(lsp_servers) do
    lsp_config[lsp].setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }
end
