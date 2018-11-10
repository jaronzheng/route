local _M = {_VERSION = '0.1'}

function _M.emtpy_table(res)
    return type(res) ~= 'table' or next(res) == nil or next(res) == ngx.null
end


return _M