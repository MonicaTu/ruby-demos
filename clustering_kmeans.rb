#!/usr/bin/env ruby
:wq
#
# Usage:
#   $ ruby clustering_kmeans.rb filename
#

require 'spreadsheet'    
require 'kmeans/pair'
require 'kmeans/pearson'
require 'kmeans/cluster'

@filename = "/home/monica/workspace/bioinformatic/project1/dataset/File 2_Cho.xls_2012.xls"

ARGV.each do|a|
    puts "Argument: #{a}"
    @filename = "#{a}" 
end


data_hash = Hash.new 

book = Spreadsheet.open(@filename)
sheet1 = book.worksheet('Sheet1') # can use an index or worksheet name

title = []
sheet1.row(0).each do |col|
    title << col
end
#p title

sheet1.each(1) do |row|
break if row[0].nil? # if first cell empty
    for j in 1..17
        data_hash[row[0]] ||= Hash.new
        data_hash[row[0]][title[j]] ||= row[j].to_f
    end
end
#puts data_hash

opt_clusters = 6
opt_loop_max = 100 
result = Kmeans::Cluster.new(data_hash, {
        :centroids => opt_clusters,
        :loop_max => opt_loop_max
        })
result.make_cluster

for i in 0..opt_clusters-1
    p result.cluster.values[i] 
end
