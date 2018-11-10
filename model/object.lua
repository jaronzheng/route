
local _M = {_VERSION = '0.1'}

local conf = require 'conf.common'
local http = require 'common.http'

function _M.object_show_batch(args)

    local req_args = {
        uid = args['uid'],
        object_ids = args['ids'],
        source = conf.SOURCE
    }

    local uri = 'http://i.api.weibo.com/2/object/show_batch.json?'

    local options = {
        read_time = 500,
        headers = {["Authorization"] = auth.getAuthHeader(uid)}
    }

    local res, err = http:http_get(uri, req_args, options)

    if err then
        ngx.log(ngx.ERR, 'action:object_show_batch ' .. err)
        return nil
    end
    return res.body
end

return _M