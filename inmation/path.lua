-- inmation.path
-- inmation Script Library Lua Script
--
-- (c) 2016 inmation BNX
--
-- Version history:
--
-- 20161117.1   Initial release.
--
require('inmation.string-extension')

pathLib = {

}

function pathLib.join(...)
    local args = {...}
    local result = table.concat(args, '/')
    result = pathLib.sanitize(result)
    return result 
end

function pathLib.parentPath(path)
    path = pathLib.sanitize(path)
    return string.gsub(path,"/[^/]+$",'' )
end

-- Remove multiple slashes '//' and remove the trailing slash
function pathLib.sanitize(path)
    if nil == path then return end
    local pathFields = path:split('/')
    local result = ''
    for i, v in ipairs(pathFields) do
        if v ~= '' then

            if result == '' then
                result = v
            else
                result = result .. '/' .. v
            end
        end
    end
    -- Check whether the result starts with a carrot. If not add the leading slash.
    if nil == result:match("^%^") then
        result = '/' .. result
    end
    -- Restore the original path ended in case it is a carrot slash.
    if nil ~= path:match("%^/$") then
        result = result .. '/'
    end
    return result
end

return pathLib