local config = {
    nats = {
        connection = {
            host    = '192.168.168.2',
            port    = 4242,
        },
        client = {
            user  = 'user',
            pass  = 'secret',
        },
        subject = 'home.iot.sensors',
    },
}

return config
