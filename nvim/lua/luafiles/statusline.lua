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
		return ""
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

local function get_git_info()
	return "[" .. vim.fn["fugitive#head"]() .. "]"
end

local function get_lsp_info()
	local w = table_length(vim.diagnostic.get(0, {severity = "w"}))
	local e = table_length(vim.diagnostic.get(0, {severity = "e"}))
	local h = table_length(vim.diagnostic.get(0, {severity = "h"}))

	if w + e + h  == 0 then
		return ""
	end

	return string.format("[H %d W %d E %d]", h, w, e)
end

function Status_line_active()
	local sections = {
		"%#TBBG#",                 -- Define color
		"[%M%R%W]",                -- Misc info
		get_file_path(),           -- The shortened filepath
		get_lsp_info(),            -- Count of error, warnings and hints
		"%=",                      -- Move rest of sections to other side
		"[%l:%c]",                 -- Cursor position
		"[%{&fileformat}]",        -- File format
		get_git_info(),            -- Git info
	}

	return table.concat(sections, " ")
end

function Status_line_inactive()
	local sections = {
		"%#TBBG#",                 -- Define color
		"[%M]",                    -- Misc info
		"[%f]",                    -- Full filepath
		"%=",                      -- Move rest of sections to other side
		"[%l:%c]",                 -- Cursor position
	}

	return table.concat(sections, " ")
end

vim.cmd [[
augroup Inits
	autocmd!
	autocmd WinEnter,BufEnter * lua vim.wo.statusline = '%!v:lua.Status_line_active()'
	autocmd WinLeave,BufLeave * lua vim.wo.statusline = '%!v:lua.Status_line_inactive()'
augroup END
]]
