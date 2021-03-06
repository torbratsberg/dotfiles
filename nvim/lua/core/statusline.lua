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

local function get_misc_info()
    return "[%#Error#%M%R%W%#TBBG#]"
end

local function get_file_path()
    local full_path = vim.fn.expand("%")

    if not full_path or full_path == "" then
        return ""
    end

    -- Get the path into a table
    local path_table = split(full_path, "/")
    local file_name = table.remove(path_table, table_length(path_table), 1)

    -- Put together the file path with only the x first chars of each dir
    local final_path = ""
    for _, dir in ipairs(path_table) do
        dir = string.sub(dir, 1, 3)
        final_path = final_path .. dir .. "/"
    end
    return "[%#Title#" .. final_path .. file_name .. "%#TBBG#]"
end

local function get_lsp_info()
    local e = table_length(vim.diagnostic.get(0, {severity = "e"}))
    local w = table_length(vim.diagnostic.get(0, {severity = "w"}))
    local n = table_length(vim.diagnostic.get(0, {severity = "n"}))

    if w + e + n == 0 then
        return ""
    end

    local err = '%#DiagnosticError#'
    local warn = '%#DiagnosticWarn#'
    local info = '%#DiagnosticInfo#'
    local reset = '%#TBBG#'

    return string.format(
        "[%sE:%d %sW:%d %sN:%d%s]",
        err, e, warn, w, info, n, reset
    )
end

local function get_cursor_position()
    return "[%#Constant#%l:%c%#TBBG#]"
end

local function get_file_format()
    return "[%#Directory#%{&fileformat}%#TBBG#]"
end

local function get_git_info()
    return "[%#GitSignsAdd#" .. vim.fn.FugitiveHead() .. "%#TBBG#]"
end

function Status_line_active()
    local sections = {
        "%#TBBG#",             -- Define color
        get_misc_info(),	   -- Misc info
        get_file_path(),       -- The shortened filepath
        get_lsp_info(),        -- Count of error, warnings and hints
        "%=",                  -- Move rest of sections to other side
        get_cursor_position(), -- Cursor position
        get_file_format(),     -- File format
        get_git_info(),        -- Git info
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
