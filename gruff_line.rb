#require 'rubygems'
require 'gruff'

g = Gruff::Line.new(600) # The graph will be 600 pixels wide.
g.title = 'Algorithm running times'
g.theme_37signals # The best-looking theme, in my opinion.
range = (1..101)
g.data('Constant', range.collect { 1 })
g.data('O(log n)', range.collect { |x| Math::log(x) / Math::log(2) })
g.data('O(n)', range.collect { |x| x })
g.data('O(n log n)', range.collect { |x| x * Math::log(x) / Math::log(2) })
g.labels = {10 => 'n=10', 50 => 'n=50', 100 => 'n=100' }
g.write('gruff_line.png')

