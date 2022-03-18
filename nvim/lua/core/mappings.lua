-- local function map(mode, lhs, rhs, opts)
-- 	local options = { noremap = true, silent = true }
-- 	if opts then
-- 		options = vim.tbl_extend('force', options, opts)
-- 	end
-- 	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

local map = function(m, l, r)
	vim.api.nvim_set_keymap(m, l, r, {noremap=true, silent=true})
end

-- LSP stuff
map('n', '<leader>cn', ':lua vim.lsp.buf.rename()<cr>')
map('n', '<leader>cf', ':lua vim.lsp.buf.formatting()<cr>')
map('n', '<leader>cj', ':lua vim.lsp.buf.hover()<cr>')
map('n', '<leader>ca', ':lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_cursor({}))<cr>')
map('n', '<leader>cr', ':lua require("telescope.builtin").lsp_references(require("telescope.themes").get_cursor({}))<cr>')
map('n', '<leader>cd', ':lua require("telescope.builtin").lsp_definitions(require("telescope.themes").get_cursor({}))<cr>')
map('n', '<leader>ct', ':lua require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy({}))<cr>')
map('n', '<leader>cs', ':lua require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_ivy({}))<cr>')

-- Harpoon stuff
map('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<cr>')
map('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<cr>')
map('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<cr>')
map('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<cr>')
map('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<cr>')
map('n', '<leader>hm', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')

-- Substitution commands
map('n', '<C-s>s', ':%s///g<left><left><left>')
map('n', '<C-s>w', '*N:%s///g<left><left>')
