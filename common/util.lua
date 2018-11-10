local _M = {_VERSION = '0.1'}

local cjson = require 'cjson'

function _M.retJson(res)
    ngx.header.content_type = 'application/json;charset=UTF-8';
    if type(res) == 'table' then
        ngx.say(cjson.encode(res))
    else
        ngx.say('[]')
    end
end

function _M.emtpy_table(res)
    return type(res) ~= 'table' or next(res) == nil or next(res) == ngx.null
end



return _M