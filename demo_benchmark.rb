#!/usr/bin/env ruby

require 'benchmark'

time = Benchmark.realtime do
    (1..10000).each{|i| i}
end
puts "#{time*1000}ms"
