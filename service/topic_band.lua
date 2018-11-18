
local _M = {_VERSION = '0.1'}

local bandModel = require 'model.topic_band'

function _M.main(args)

end


function _M.originband(args)

    local args = {
    }

    return bandModel.getTopicBandList(args)
end

function _M.test()
    local res = ngx.location.capture(
        '/test1', {args = {}}
    )

    return res.body
end

function _M.test1()
    return 'hello capture'
end


return _M

