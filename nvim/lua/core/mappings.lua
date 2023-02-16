local set = vim.keymap.set

-- Keyboards should have escape key on home row
set('i', 'jj', '<esc>')

-- Substitution commands
set('n', '<C-s>s', ':%s///g<left><left><left>')
set('n', '<C-s>w', '*N:%s///g<left><left>')

-- Git commands
set('n', '<leader>gs', ':vertical G<cr>')
set('n', '<leader>gbl', ':Git blame<cr>')
set('n', '<leader>gbr', ':Telescope git_branches<cr>')
set('n', '<leader>gd', ':Gdiffsplit<cr>')
set('n', '<leader>gll', ':Git log --decorate<cr>')
set('n', '<leader>gln', ':Git log --name-status<cr>')
set('n', '<leader>gg', ':Git pull<cr>')
set('n', '<leader>gp', ':Git push<cr>')
set('n', '<leader>g<left>', ':diffget //2<cr>')
set('n', '<leader>g<right>', ':diffget //3<cr>')

-- Quickfix and local lists
set('n', '<leader>j', ':cprev<cr>')
set('n', '<leader>k', ':cnext<cr>')
set('n', '<leader>u', ':lprev<cr>')
set('n', '<leader>i', ':lnext<cr>')

-- Misc
set('n', '<leader>w', ':w<cr>')
set('n', '<leader>y', '"+y')
set('n', '<leader><leader>q', ':bd<cr>')
set('n', 'Y', 'yg_')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')
set('n', 'ª', ':move-2<cr>V=<esc>')
set('n', '√', ':move+1<cr>V=<esc>')
set('n', '<leader>cc', ':so ~/.config/nvim/init.vim<cr>')
set('n', '<cr>', ':call SelectIndent()<cr>')
set('n', '<leader><cr>', ':call SelectIndentWithSpace()<cr>')
set('n', '<tab><tab>', '<C-^>')
set('v', '<', '< gv')
set('v', '>', '> gv')
set('v', '<leader>y', '"+y')
set('v', '*', 'y/<C-r>0<cr>')
set('i', '{<cr>', '{<cr>}<esc>O')
set('t', '<leader><esc>', '<C-\\><C-n>')
set('n', '<leader>a', '<Plug>(easymotion-bd-f)')
set('n', '<A-v>', '<C-v>')
set('n', '<leader><leader>r', '<Plug>RestNvim')
set('n', '<C-c><C-c>', function()
    print(loadstring('print(' .. vim.fn.getline('.') .. ')')())
end)

-- Harpoon
set('n', '<leader>ha', function() require("harpoon.mark").add_file() end)
set('n', '<leader>hh', function() require("harpoon.ui").toggle_quick_menu() end)
set('n', '<leader>h1', function() require("harpoon.ui").nav_file(1) end)
set('n', '<leader>h2', function() require("harpoon.ui").nav_file(2) end)
set('n', '<leader>h3', function() require("harpoon.ui").nav_file(3) end)
set('n', '<leader>h4', function() require("harpoon.ui").nav_file(4) end)

-- Keymap to open stuff other places
set('n', '<leader>nj', function()
    local browser = '!/mnt/c/Program\\ Files/BraveSoftware/Brave-Browser/Application/brave.exe'
    local word = vim.fn.expand('<cword>')
    local prompt = 'Which program do you want to open?\n'
    local options = { 'Jira', 'GitHub' }

    for i, item in pairs(options) do
        prompt = prompt .. i .. '. ' .. item .. '\n'
    end
    local choice = vim.fn.input(prompt)

    if choice == '1' or choice == 'jira' then
        -- Open Jira
        if word ~= '' then
            vim.cmd(browser .. ' https://norconsultdigital.atlassian.net/browse/FDVIE-' .. word)
        else
            vim.cmd(browser .. ' https://norconsultdigital.atlassian.net/browse/')
        end
    elseif choice == '2' or choice == 'gh' or choice == 'github' then
        -- Open GitHub
        vim.cmd(browser .. ' https://github.com/' .. word)
    end
end)

-- Looking up stuff commands
set('n', '<leader>f', function() require('telescope.builtin').find_files(require('telescope.themes').get_ivy({})) end)
set('n', '<leader>r', function() require('telescope.builtin').resume(require('telescope.themes').get_ivy({})) end)
set('n', '<leader>b', function() require('telescope.builtin').buffers(require('telescope.themes').get_ivy({})) end)
set('n', '<leader>nn', function() require('telescope.builtin').find_files({ prompt_title = 'Notes', cwd = '~/main/notes/' }) end)
set('n', '<leader>nv', function() require('telescope.builtin').find_files({ prompt_title = 'Config files', cwd = '~/.config/' }) end)

-- LSP stuff
set('n', '<leader>cn', function() vim.lsp.buf.rename() end)
set('n', '<leader>cf', function() vim.lsp.buf.formatting() end)
set('n', '<leader>cj', function() vim.lsp.buf.hover() end)
set('n', '<leader>ct', function() vim.diagnostic.setloclist() end)
set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)
set('n', '<leader>cr', function() require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({})) end)
set('n', '<leader>cd', function() require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor({})) end)
set('n', '<leader>cs', function() require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({})) end)
set('i', '<C-n>', function() require'cmp'.select_next_item() end)
set('i', '<C-p>', function() require'cmp'.select_prev_item() end)

-- Luasnip
set('i', '<C-f>', function() require('luasnip').expand_or_jump() end)
set('s', '<C-f>', function() require('luasnip').expand_or_jump() end)
