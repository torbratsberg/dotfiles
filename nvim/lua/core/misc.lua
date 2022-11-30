vim.cmd("filetype plugin indent on")
vim.cmd("autocmd FileType scss setl iskeyword+=@-@")

local command = vim.api.nvim_create_user_command
command('NewReactComponent', ':lua NewReactComponent()<cr>', {})

function NewReactComponent()
    vim.cmd('read ~/.config/nvim/templates/react-component.txt')
    vim.cmd("exec '%s/misc/' . expand('%:t:r') . '/ge'")
end
