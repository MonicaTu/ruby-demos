#!/usr/bin/env ruby

require 'gruff'

g = Gruff::StackedBar.new('450x450') 

g.sort = false
g.maximum_value = 100 
g.minimum_value = 0 
g.y_axis_increment = 10

g.title = 'Quarterly Exams'

g.data('English',[20,30,40])
g.data('Maths',[10,20,30])
g.sort = false 

g.write('gruff_stackedbar.png')
