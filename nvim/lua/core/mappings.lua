local set = vim.keymap.set

-- Keyboards should have escape key on home row
set('i', 'jj', '<esc>')

-- Substitution commands
set('n', '<C-s>s', ':%s///g<left><left><left>')
set('n', '<C-s>w', '*N:%s///g<left><left>')

-- Git commands
set('n', '<leader>gs', '<cmd>G<cr>')
set('n', '<leader>gbl', '<cmd>Git blame<cr>')
set('n', '<leader>gbr', '<cmd>Telescope git_branches<cr>')
set('n', '<leader>gd', '<cmd>Gdiffsplit<cr>')
set('n', '<leader>gll', '<cmd>Git log --decorate<cr>')
set('n', '<leader>gln', '<cmd>Git log --name-status<cr>')
set('n', '<leader>gg', '<cmd>Git pull<cr>')
set('n', '<leader>gp', '<cmd>Git push<cr>')
set('n', '<leader>g<left>', '<cmd>diffget //2<cr>')
set('n', '<leader>g<right>', '<cmd>diffget //3<cr>')

-- Tabbing
set('n', '<leader>tn', '<cmd>tabnew<cr>')
set('n', '<leader>tc', '<cmd>tabclose<cr>')

-- Quickfix and local lists
set('n', '<leader>j', '<cmd>cprev<cr>')
set('n', '<leader>k', '<cmd>cnext<cr>')
set('n', '<leader>u', '<cmd>lprev<cr>')
set('n', '<leader>i', '<cmd>lnext<cr>')

-- Misc
set('n', '<leader>w', '<cmd>w<cr>')
set('n', '<leader>y', '"+y')
set('n', '<leader><leader>q', '<cmd>bd<cr>')
set('n', 'Y', 'yg_')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')
set('n', ',', 'za')
set('n', '<M-k>', '<cmd>move-2<cr>V=<esc>')
set('n', '<M-j>', '<cmd>move+1<cr>V=<esc>')
set('n', '<leader>cc', '<cmd>so ~/.config/nvim/init.vim<cr>')
set('n', '<cr>', '<cmd>call SelectIndent()<cr>')
set('n', '<leader><cr>', '<cmd>call SelectIndentWithSpace()<cr>')
set('n', '<tab><tab>', '<C-^>')
set('v', '<', '< gv')
set('v', '>', '> gv')
set('v', '<leader>y', '"+y')
set('v', '*', 'y/<C-r>0<cr>')
set('i', '{<cr>', '{<cr>}<esc>O')
set('t', '<leader><esc>', '<C-\\><C-n>')
set('n', '<A-v>', '<C-v>')
set('n', '<leader>.', '<cmd>popup Main<cr>')
set('n', '<leader>,', '<cmd>popup SwapApi<cr>')
set('n', '<C-c><C-c>', function()
    print(loadstring('print(' .. vim.fn.getline('.') .. ')')())
end)
set('n', '<up>', '5<C-w>+')
set('n', '<down>', '5<C-w>-')
set('n', '<left>', '5<C-w>>')
set('n', '<right>', '5<C-w><')
set('n', '<leader>zz', '<cmd>ZenMode<cr>')

-- Looking up stuff commands
set('n', '<leader>f', function() require('telescope.builtin').find_files(require('telescope.themes').get_ivy({})) end)
set('n', '<leader>r', function() require('telescope.builtin').resume(require('telescope.themes').get_ivy({})) end)
set('n', '<leader>b', function() require('telescope.builtin').buffers(require('telescope.themes').get_ivy({})) end)
set('n', '<leader>nn', function() require('telescope.builtin').find_files({ prompt_title = 'Notes', cwd = '~/main/notes/' }) end)
set('n', '<leader>ns', function() require('telescope.builtin').find_files({ prompt_title = 'Slides', cwd = '~/main/slides/' }) end)
set('n', '<leader>nv', function() require('telescope.builtin').find_files({ prompt_title = 'Config files', cwd = '~/.config/' }) end)

-- LSP stuff
set('n', '<leader>cn', function() vim.lsp.buf.rename() end)
set('n', '<leader>cf', function() vim.lsp.buf.formatting() end)
set('n', '<leader>cj', function() vim.lsp.buf.hover() end)
set('n', '<leader>ct', function() vim.diagnostic.setloclist() end)
set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)
set('n', '<leader>cr', function() require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({})) end)
set('n', '<leader>cd', function() require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor({})) end)
set('n', '<leader>ci', function() require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor({})) end)
set('n', '<leader>cs', function() require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({})) end)
set('i', '<C-n>', function() require'cmp'.select_next_item() end)
set('i', '<C-p>', function() require'cmp'.select_prev_item() end)

-- Luasnip
set('i', '<C-f>', function() require('luasnip').expand_or_jump() end)
set('s', '<C-f>', function() require('luasnip').expand_or_jump() end)

-- Visual paragraph jumping/navigation
set('n', '<C-j>', '<esc>}kvip')
set('n', '<C-k>', '<esc>{jvip')
set('v', '<C-j>', 'j<esc>}kvip')
set('v', '<C-k>', 'ok<esc>{jvip')
