#!/usr/bin/env ruby

require 'ai4r/clusterers/average_linkage'

include Ai4r::Clusterers
include Ai4r::Data

@@data = [  [10, 3], [3, 10], [2, 8], [2, 5], [3, 8], [10, 3],
            [1, 3], [8, 1], [2, 9], [2, 5], [3, 3], [9, 4]]

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

#=== demo2 ===
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

def demo2
  p "=== demo2 ==="
  data_set = DataSet.new(:data_items => @@data, :data_labels => ["X", "Y"])
  
  create_distance_matrix(data_set)
  p @distance_matrix
end

#demo1
demo2
