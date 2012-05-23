
class StatsD
    constructor: (host, port) ->
        @udpClient = new UDPClient host, port

    # Set a value that persists between flushes
    gauge: (bucket, value) ->
        @stat bucket, value, 'g'

    # Creates or modifies a gauge
    gaugeDelta: (bucket, delta) ->
        @stat bucket, delta, 'gd'

    # Creates or modifies a counter that resets to zero on a flush
    counter: (bucket, delta) ->
        @stat bucket, delta, 'c'

    # Sends timing information
    timing: (bucket, milliseconds) ->
        @stat bucket, milliseconds, 'ms'

    stat: (bucket, value, modifier) ->
        @udpClient.send "#{bucket}:#{value}|#{modifier}", (err, bytes) ->
            console.log err.msg if err

class UDPClient
    constructor: (@host, @port) ->
        @socket = (require 'dgram').createSocket 'udp4'

    send: (data, done) ->
        buffer = new Buffer data
        @socket.send buffer, 0, buffer.length, @port, @host, done

exports.StatsD = StatsD
