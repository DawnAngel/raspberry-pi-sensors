# Raspberry Pi Sensors

Here there all the required Lua scripts to let your Raspberry Pi read information 
from a sensor and report it to a NATS server.

## How to setup your Raspberry Pi:

First via apt-get install the following software

* Lua >= 5.1
* Luarocks

Also you'll need to install some libraries from Luarocks

* [luasocket](https://github.com/diegonehab/luasocket)
* [lua-cjson](https://github.com/mpx/lua-cjson)
* [uuid](https://github.com/Tieske/uuid)

In order to use a sensor like DS18B20 for temperature:

* sudo modprobe w1-gpio 
* sudo modprobe w1_therm

And here is the guide I used:

https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/temperature/

