#!/usr/bin/env ruby

require 'ai4r/clusterers/average_linkage'

include Ai4r::Clusterers
include Ai4r::Data

@@data = [  [10, 3.10], [3, 10.3], [2, 8.2], [2, 5.2], [3, 8.3], [10, 3.1],
            [1, 3.1], [8, 1.8], [2, 9.2], [2, 5.2], [3, 3.3], [9, 4.9]]

#=== demo1 ===
def demo1
  p "=== demo1 ==="
  data_set = DataSet.new(:data_items => @@data, :data_labels => ["X", "Y"])
  
  clusterer = AverageLinkage.new
  clusterer.build(data_set, 4)
  
  clusterer.clusters.each do |cluster|
    p cluster.data_items
  end
end

#=== demo2-1 ===
def create_distance_matrix(data_set)
  @distance_function = lambda do |a,b|
  Ai4r::Data::Proximity.squared_euclidean_distance(
    a.select {|att_a| att_a.is_a? Numeric} ,
    b.select {|att_b| att_b.is_a? Numeric})
  end

  @distance_matrix = Array.new(data_set.data_items.length-1) {|index| Array.new(index+1)}
  data_set.data_items.each_with_index do |a, i|
    i.times do |j|
      b = data_set.data_items[j]
      @distance_matrix[i-1][j] = @distance_function.call(a, b)
    end
  end
end

def demo2a
  p "=== demo2a ==="
  data_set = DataSet.new(:data_items => @@data, :data_labels => ["X", "Y"])
  
  create_distance_matrix(data_set)
  p @distance_matrix
end

#=== demo2-2 ===
require 'spreadsheet'

def read_distance_matrix(index_a, index_b)
  return 0 if index_a == index_b
  index_a, index_b = index_b, index_a if index_b > index_a
  return @distance_matrix[index_a-1][index_b]
end

def demo2b
  p "=== demo2b ==="
  book = Spreadsheet::Workbook.new
  sheet = book.create_worksheet
  sheet.name = 'My First Worksheet'
  
  sheet.row(0).concat %w{g1 g2 g3}
  sheet[2,0] = read_distance_matrix(1, 0) 
  sheet[3,0] = read_distance_matrix(2, 0) 
  sheet[4,0] = read_distance_matrix(3, 0) 
  sheet[5,0] = read_distance_matrix(4, 0) 

  sheet[1,1] = sheet[2,0]
  sheet[1,2] = sheet[3,0]
  sheet[1,3] = sheet[4,0]
  sheet[1,4] = sheet[5,0]
  
  book.write 'excel-ai4r_average_linkage.xls'
end

#demo1
demo2a
demo2b
