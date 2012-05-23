StatsD = (require './statsd').StatsD
statsd = new StatsD 'localhost', 8125

statsd.gauge 'test', 123

