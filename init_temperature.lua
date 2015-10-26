package.path = 'libs/?.lua;' .. package.path
pcall(require, 'luarocks.require')

sensor = require('sensor-ds18b20-temperature/sensor')
config = require('config')
cjson  = require('cjson')
nats   = require('nats')

function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

function sensor_data_to_nats(nats_client)
    local payload = {
        id   = sensor.id,
        data = tostring(sensor.get_data()),
    }

    nats_client:publish(config.nats.subject, cjson.encode(payload))
end

function run_data_reporter()
    local nats_client = nats.connect(config.nats.connection)

    if config.nats.client.user ~= nil and config.nats.client.pass ~= nil then
        nats_client:set_auth(config.nats.client.user, config.nats.client.pass)
    end

    print('Connected successfully ..')
    nats_client:connect()

    while true do
        sensor_data_to_nats(nats_client)
        sleep(1)
    end
end

sensor.setup()

-- Main data reporter loop
while true do
    pcall(run_data_reporter)

    print('Something happen .. reset in 1 second ..')
    sleep(1)
end
