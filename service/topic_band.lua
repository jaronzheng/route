
local _M = {_VERSION = '0.1'}

local bandModel = require 'model.topic_band'
local util = require 'common.util'

function _M.main(args)

    local args = {


    }

end


function _M.originband(args)

    local args = {
    }

    local res = bandModel.getTopicBandList(args)

    util.retJson(res)
end


return _M

