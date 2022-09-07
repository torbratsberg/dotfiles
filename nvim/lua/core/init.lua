require('Comment').setup()

require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

require'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true
    },
    indent = {
        enable = false,
    }
}

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            '%.png',
            '%.otf',
            '%.jpg',
            '%.jpeg',
            '%.woff',
            '%.woff2',
            '%.ttf',
            '%.eot',
            '%.map',
            '%.po',
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

-- Require local config files
require('core.lsp')
require('core.statusline')
require('core.options')
require('core.luasnip')
require('core.mappings')
require('core.autocmds')
require('core.misc')
