
local http = require "common.http"

local _M = {_VERSION = '0.1' }
local mt = {__index = _M }


function _M.new(self)
    return setmetatable({}, mt)
end

--话题榜
function _M.getTopicBandList(self,args)
    local req_args = {
        uid = args['uid'] or 0,
        count = args['count'] or 40,
        category = args['category'] or 'all',
        page = args['page'] or 1,
        seqid = args['seqid'] or ''
    }

    local uri = "http://www.baidu.com"

    return  http.http_get(uri, req_args, {read_time = 400})
end

function _M.getMyMangeList(self, args)

    local req_args = {
        uid = args['uid'] or 0,
        sid = args['sid'] or '',
        page = args['page'] or 1,
        page_size = args['page_size'] or 10,
        seqid = args['seqid'] or ''
    }

    local uri = 'http://adsapi.s.weibo.com/adsapi/topic/manageTopic.json'

    return  http:http_get(uri, req_args)
end


return _M
