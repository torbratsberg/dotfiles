-- Initiate Comment
require('Comment').setup()

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

-- Initiate lsp
require('luafiles.lsp')

-- Initiate nvim-tree
require'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true,
	auto_close = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	view = {
		width = 30,
		height = 30,
		side = 'left',
		auto_resize = true,
	}
}
