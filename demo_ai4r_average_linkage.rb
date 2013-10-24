#!/usr/bin/env ruby

require 'ai4r/clusterers/average_linkage'

include Ai4r::Clusterers
include Ai4r::Data


@@data = [  [10, 3], [3, 10], [2, 8], [2, 5], [3, 8], [10, 3],
            [1, 3], [8, 1], [2, 9], [2, 5], [3, 3], [9, 4]]

data_set = DataSet.new(:data_items => @@data, :data_labels => ["X", "Y"])

clusterer = AverageLinkage.new
clusterer.build(data_set, 4)

clusterer.clusters.each do |cluster|
  p cluster.data_items
end
