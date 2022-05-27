-- Initiate Comment
require('Comment').setup()

-- Initiate harpoon
require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    },
})

-- Initiate Treesitter
require'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true
    },
    indent = {
        enable = false,
    }
}

-- Telescope configs
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {'%.png', '%.otf', '%.jpg', '%.jpeg', '%.woff', '%.woff2', '%.ttf', '%.eot', '%.map', '%.po',},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

-- Initiate lightspeed
require('lightspeed').setup{
    jump_to_unique_chars = false,
    safe_labels = {},
}

-- Require local config files
require('core.lsp')
require('core.statusline')
require('core.options')
require('core.luasnip')
require('core.mappings')
require('core.autocmds')
