
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

    local uri = "http://huati.data.search.weibo.com:31334/2/topic/topic_list.json"

    local res, err = http:http_get(uri, req_args, {read_time = 400})

    if not res or err then
        ngx.log(ngx.ERR, 'action:topic_band get empty')
        return nil
    end
    return res.body
end

function _M.getMyMangeList(args)

    local req_args = {
        uid = args['uid'] or 0,
        sid = args['sid'] or '',
        page = args['page'] or 1,
        page_size = args['page_size'] or 10,
        seqid = args['seqid'] or ''
    }

    local uri = 'http://adsapi.s.weibo.com/adsapi/topic/manageTopic.json'

    local res, err = http:http_get(uri, req_args)

    if not res or err then
        ngx.log(ngx.ERR, 'action:my_manage_topic_list  get empty')
        return nil
    end
    return res.body

end




return _M
