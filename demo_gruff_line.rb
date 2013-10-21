#!/usr/bin/env ruby

require 'gruff'

# === demo 1 ===
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


# === demo 2 ===
@filename = "/home/monica/workspace/bioinformatic/project1/dataset/File 2_Cho.xls_2012.xls"
ARGV.each do|a|
    puts "Argument: #{a}"
    @filename = "#{a}" 
end

#=== data preparation ===
require 'spreadsheet'    

book = Spreadsheet.open(@filename)
sheet1 = book.worksheet('Sheet1') # can use an index or worksheet name
dimensions = sheet1.dimensions
cols = dimensions[3]-1

title = []
sheet1.row(0).each do |col|
    title << col
end
#p title

data_hash = Hash.new 
sheet1.each(1) do |row|
break if row[0].nil? # if first cell empty
    for j in 1..cols
        data_hash[row[0]] ||= Hash.new
        data_hash[row[0]][title[j]] ||= row[j].to_f
    end
end
#puts data_hash

# profile
profile = Gruff::Line.new(600) # The graph will be 600 pixels wide.
profile.title = 'clusters'
profile.theme_37signals # The best-looking theme, in my opinion.
for i in 1..10
    range = []
    for j in 1..cols
        range << sheet1.cell(i, j)
    end
#    p range
    profile.data(sheet1.cell(i, 0), range)
end
profile.write('gruff_profile.png')
