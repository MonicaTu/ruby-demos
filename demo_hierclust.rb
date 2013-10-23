#!/usr/bin/env ruby

require 'hierclust'

points = (1..6).map { Hierclust::Point.new(rand(10), rand(10)) }
clusterer = Hierclust::Clusterer.new(points)
puts clusterer.clusters #=> [[[(4, 9), (4, 8)], (9, 6)], [[(1, 4), (3, 1)], (6, 3)]]

