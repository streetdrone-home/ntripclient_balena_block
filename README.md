# ntripclient_balena_block
Run ntripclient in a Balena service.

This block wraps [ntripclient](https://software.rtcm-ntrip.org/browser/ntrip/trunk/ntripclient) to provide a 'Networked Transport of RTCM via Internet Protocol (NTRIP)' client to be integrated into a Balena deployment.

A start script is provided to run the client with settings determined from the environment.
The following environment variables can be used to configure it:

- `NTRIP_HOST` - Hostname of NTRIP server, e.g. 'rtk2go.com'
- `NTRIP_PORT` - NTRIP server port, e.g. 2101
- `NTRIP_MOUNTPOINT` - Mountpoint/caster name to use, e.g. 'OXTS1'
- `NTRIP_USERNAME` - Username to use to log in to server
- `NTRIP_PASSWORD` - Password to use to log in to server
- `NTRIP_SERDEVICE` - Serial device to output data to, e.g. '/dev/ttyUSB0'. If not provided, data will be printed to standard output
- `NTRIP_BAUD` - Baud rate to use for communication with serial port, e.g. 115200
