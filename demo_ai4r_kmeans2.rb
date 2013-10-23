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
require 'ai4r/clusterers/k_means'

include Ai4r::Clusterers
include Ai4r::Data

data_set = DataSet.new(:data_items => @@data, :data_labels => title)
clusterer = KMeans.new.build(data_set, 4)
clusterer.clusters.each do |cluster|
  p cluster.data_items
end
