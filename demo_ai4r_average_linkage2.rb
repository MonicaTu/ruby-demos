#!/usr/bin/env ruby

#
# Usage:
#   $ ./program filename
#

@filename = "/home/monica/workspace/bioinformatic/project1/dataset/File 2_Cho.xls_2012.xls"

ARGV.each do|a|
    puts "Argument: #{a}"
    @filename = "#{a}" 
end
p @filename

#=== data preparation ===
require 'spreadsheet'    

book = Spreadsheet.open(@filename)
sheet1 = book.worksheet('Sheet1') # can use an index or worksheet name
dimensions = sheet1.dimensions
cols = dimensions[3]-1

title = []
i = 0
sheet1.row(0).each do |col|
    if i != 0
        title << col
    end
    i = i+1
end
#p title

lables = []
sheet1.each(1) do |row|
break if row[0].nil? # if first cell empty
    lables << row[0]
end
#p lables

@@data = Array.new 
i = 0
sheet1.each(1) do |row|
break if row[0].nil? # if first cell empty
    for j in 1..cols
        @@data[i] ||= Array.new
        @@data[i][j-1] ||= row[j].to_f
    end
    i = i+1
end
#p @@data 

#=== clustering ===
require 'ai4r/clusterers/average_linkage'

include Ai4r::Clusterers
include Ai4r::Data

data_set = DataSet.new(:data_items => @@data, :data_labels => title)

clusterer = AverageLinkage.new
clusterer.build(data_set, 6)

# Note: Should add attr_reader :index_clusters in lib.
puts "\nindex_clusters:\n#{clusterer.index_clusters}"

puts "\ncluster.data_items:"
clusterer.clusters.each do |cluster|
  p cluster.data_items
end

#=== profile ===
require 'gruff'

j = 0
clusterer.clusters.each do |cluster|
  profile = Gruff::Line.new(1000) # The graph will be 600 pixels wide.
  profile.title = 'clusters'
  profile.theme_37signals # The best-looking theme, in my opinion.
  profile.hide_legend = true
  profile.maximum_value = 3
  profile.minimum_value = -3
  i = 0
  cluster.data_items.each do |data_items|
    profile.data("#{i}", data_items) #FIXME
    i = i+1
  end
  profile.write("average_linkage_profile_#{j}.png")
  j = j+1
end
