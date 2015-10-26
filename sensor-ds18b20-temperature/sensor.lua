-- Temperature sensor (DS18B20)
-- Tested with Lua Raspberry Pi

local sensor = {}

sensor.id = 'raspberry-pi-temperature-ds18b20'

local FILENAME

function sensor.setup()
    FILENAME = '/sys/bus/w1/devices/w1_bus_master1/28-011564b09aff/w1_slave'
end

function sensor.get_data()
    local file = io.open(FILENAME, "r")
    io.input(file)
    io.read()
    io.read(29)
    local value = tonumber(io.read())
    return value / 1000
end

return sensor
