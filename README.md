# statsd.coffee

A client written for [Etsy](http://etsy.com)'s [StatsD](https://github.com/etsy/statsd) server. It
is a port of node-statsd.

It will let you fire stats at your StatsD server.

    > StatsD = (require 'node-statsd').StatsD
    > statsd = new StatsD 'localhost', 8125
    > statsd.gauge 'test', 51
    > statsd.gaugeDelta 'test', 33

Support for sampling has been removed.

# License

node-statsd is licensed under the MIT license.
