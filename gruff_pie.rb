#require 'rubygems'
require 'RMagick'
require 'gruff'

p = Gruff::Pie.new
#p.theme_monochrome
p.title = "Survey: the value of pi"
p.data('"About three"', [3])
p.data('3.14', [8])
p.data('3.1415', [11])
p.data('22/7', [8])
p.write('pipie.png')

