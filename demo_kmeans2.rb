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

#=== clustering ===
require 'kmeans/pair'
require 'kmeans/pearson'
require 'kmeans/cluster'

opt_clusters = 6
opt_loop_max = 100 
result = Kmeans::Cluster.new(data_hash, {
        :centroids => opt_clusters,
        :loop_max => opt_loop_max
        })
result.make_cluster

#for i in 0..opt_clusters-1
#    p result.cluster.values[i] 
#end
