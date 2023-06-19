vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = {"*"},
    callback = function() require'vim.highlight'.on_yank({timeout = 100}) end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"qf"},
    command = "nmap <buffer> <cr> <cr>"
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*"},
    callback = function()
        local full_path = vim.fn.expand("%:p")

        local work_dirs = {
            "ISY",
        }

        for _, work_dir in ipairs(work_dirs) do
            if string.find(full_path, work_dir) then
                vim.opt_local.shiftwidth = 2
                vim.opt_local.tabstop = 2
            else
                vim.opt_local.shiftwidth = 4
                vim.opt_local.tabstop = 4
            end
        end
    end
})

vim.api.nvim_create_autocmd({"WinEnter", "BufEnter", "BufWritePost"}, {
    pattern = {"*"},
    callback = function()
        vim.wo.statusline = Status_line_active()
    end
})

vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    pattern = {"*"},
    callback = function()
        vim.wo.statusline = Status_line_inactive()
    end
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = {"plugins.lua"},
    callback = function()
        vim.cmd('source %')
        vim.cmd('PackerCompile')
    end
})
