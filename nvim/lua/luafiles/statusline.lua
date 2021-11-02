local write_count = 0
local git_branch = ""

-- Helper functions

local function split(inputstr, sep)
	local t = {}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

local function table_length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- Section functions

local function get_file_path()
	local full_path = vim.fn.expand("%")

	if not full_path or full_path == "" then
		return "[no name]"
	end

	-- Get the path into a table
	path_table = split(full_path, "/")
	file_name = table.remove(path_table, table_length(path_table), 1)

	-- Put together the file path with only the x first chars of each dir
	final_path = ""
	for i, dir in ipairs(path_table) do
		dir = string.sub(dir, 1, 3)
		final_path = final_path .. dir .. "/"
	end
	return "[" .. final_path .. file_name .. "]"
end

local function get_git_info(force)
	if force or not git_branch or git_branch == "" then
		git_branch = vim.fn["fugitive#head"]()
		if not git_branch or git_branch == "" then
			git_branch = '[no git]'
		end
	end
	return "[" .. git_branch .. "]"
end

local function get_lsp_info()
	local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
	local errors = vim.lsp.diagnostic.get_count(0, "Error")
	local hints = vim.lsp.diagnostic.get_count(0, "Hint")
	local info = vim.lsp.diagnostic.get_count(0, "Info")
	return string.format("[I %d H %d W %d E %d]", info, hints, warnings, errors)
end

-- Put together the statusline
function Status_line()
	local sections = {
		"%#TBBG#",                 -- Define color
		"[%M%R%W]",                -- Misc info
		get_file_path(),           -- The shortened filepath
		get_lsp_info(),            -- Count of error, warnings and hints
		"%=",                      -- Move rest of sections to other side
		"[" .. write_count .. "]", -- How many times I've written any file
		"[%l:%c]",                 -- Cursor position
		get_git_info(),            -- Git info
	}

	return table.concat(sections, " ")
end

-- Set the statusline option
vim.o.statusline = '%!v:lua.Status_line()'

local M = {}

-- Update write count
M.on_write = function()
	write_count = write_count + 1
end

-- On save, run on_write function above
vim.api.nvim_exec([[
	augroup statusline_write_count
		autocmd!
		autocmd BufWritePre * :lua require("luafiles.statusline").on_write()
	augroup END
]], false)

return M
