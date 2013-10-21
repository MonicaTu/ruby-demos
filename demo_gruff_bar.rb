#!/usr/bin/env ruby

require 'gruff'

g = Gruff::Bar.new(600) # The graph will be 600 pixels wide.
g.title = 'Algorithm running times'
#g.theme_37signals # The best-looking theme, in my opinion.
range = (0..500)
#g.data('Constant', range.collect { 1 })
#g.data('O(log n)', range.collect { |x| Math::log(x) / Math::log(2) })
#g.data('O(n)', range.collect { |x| x })
#g.data('O(n log n)', range.collect { |x| x * Math::log(x) / Math::log(2) })
a = []
a.push(128)
a.push(255)
a.push(77)
a.push(50)
a.push(0)
#p.data('0', 128)
#p.data('10', 255)
#p.data('50', 77)
#p.data('77', 50)
#p.data('100', 0)
g.data('summary', a)
#g.labels = {10 => 'n=10', 50 => 'n=50', 100 => 'n=100' }
#g.labels = {10 => 'n=10', 50 => 'n=50', 100 => 'n=100' }
g.write('gruff_bar.png')

#g = Gruff::Bar.new(600) # The graph will be 600 pixels wide.
#g.title = 'Algorithm running times'
#g.theme_37signals # The best-looking theme, in my opinion.
#range = (1..101)
#g.data('Constant', range.collect { 1 })
#g.data('O(log n)', range.collect { |x| Math::log(x) / Math::log(2) })
#g.data('O(n)', range.collect { |x| x })
#g.data('O(n log n)', range.collect { |x| x * Math::log(x) / Math::log(2) })
#g.labels = {10 => 'n=10', 50 => 'n=50', 100 => 'n=100' }
#g.write('gruff_bar.png')
