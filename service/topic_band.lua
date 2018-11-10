
local _M = {_VERSION = '0.1'}

local bandModel = require 'model.topic_band'

function _M.main(args)

end


function _M.originband(args)

    local args = {
    }

    return bandModel.getTopicBandList(args)
end


return _M

