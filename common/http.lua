
local http = require "resty.http"

local _M = {_VERSION = '0.1'}


function _M.http_get(url, args, options)

    local args = args or {}
    local connect_time = options['connect_time'] or 100
    local send_time = options['send_time'] or 100
    local read_time = options['read_time'] or 500

    local headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded"
    }

    if options['headers'] then
        for k, v in ipairs(options['headers']) do
            local tmpHeader = {[k] = v}
            table.insert(headers, tmpHeader)
        end
    end

    local httpc = http.new()
    httpc:set_timeouts(connect_time, send_time, read_time)

    url = url .. ngx.encode_args(args)

    local res, err = httpc:request_uri(url, {
        headers = headers
    })
    if not res or err then
        return res, err
    end
    httpc:set_keepalive(1000, 100)
    return res
end

return _M