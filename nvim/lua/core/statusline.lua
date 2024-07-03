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
    return "[%M%R%W]"
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
    return "[" .. final_path .. file_name .. "]"
end

local function get_lsp_info()
    local e = table_length(vim.diagnostic.get(0, {severity = "e"}))
    local w = table_length(vim.diagnostic.get(0, {severity = "w"}))
    local n = table_length(vim.diagnostic.get(0, {severity = "n"}))

    if w + e + n == 0 then
        return ""
    end

    return string.format(
        "[E:%d W:%d N:%d]",
        e, w, n
    )
end

local function get_cursor_position()
    return "[%l:%c]"
end

local function get_git_info()
    return "[" .. vim.fn.FugitiveHead() .. "]"
end

function Status_line_active()
    local sections = {
        "%#FloatTitle#",
        get_misc_info(),
        get_file_path(),
        get_lsp_info(),
        "%#StatusLine#",
        "%=%#FloatTitle#",
        "" .. get_cursor_position(),
        get_git_info(),
        "",
    }

    return table.concat(sections, " ")
end

function Status_line_inactive()
    local sections = {
        "[%M]",    -- Misc info
        "[%f]",     -- Full filepath
        "%=",       -- Move rest of sections to other side
        "[%l:%c]", -- Cursor position
    }

    return table.concat(sections, " ")
end
