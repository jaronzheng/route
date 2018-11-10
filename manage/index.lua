local cjson = require "cjson"
local app = require 'manage.app'
local topicBand = require 'serive.topic_band'

local _M = {}

function _M.check_require_params(params, names)
    for _, name in pairs(names) do
        if params[name] == nil then
            ngx.header.content_type = 'application/json;charset=UTF-8';
            ngx.say(cjson.encode({ errno = 101, status = 400, msg = "missing param:" .. name }))
            ngx.status = 400
            ngx.exit(400)
        end
    end
end


function _M.run()
    app:route("/topic/originband", function(params)
        topicBand:originband(params)
    end)
    app:run()
end

return _M
