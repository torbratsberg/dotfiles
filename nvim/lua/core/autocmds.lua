vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = {"*.go"},
	callback = vim.lsp.buf.formatting
})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
	pattern = {"*"},
	callback = function() require'vim.highlight'.on_yank({timeout = 100}) end
})

vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {"qf"},
	command = "nmap <buffer> <cr> <cr>"
})
