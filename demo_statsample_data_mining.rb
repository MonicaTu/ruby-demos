#!/usr/bin/env ruby

require 'statsample'

data = [[7, 26, 6, 60 ],
        [1, 29, 15, 52],
        [11, 56, 8, 20],
        [11, 31, 8, 47],
        [7, 52, 6, 33 ],
        [11, 55, 9, 22],
        [3, 71, 17, 6 ],
        [1, 31, 22, 44],
        [2, 54, 18, 22],
        [21, 47, 4, 26],
        [1, 40, 23, 34],
        [11, 66, 9, 12],
        [10, 68, 8, 12]]
puts "====== data ======"
p data.length
data.each { |d| p d }

data_vectors_in_hash = Hash[ data.map {|d| ["d#{data.index(d)}", d.to_scale]} ]
#p data_vectors_in_hash

dataT = data.transpose 
puts "====== dataT ======"
p dataT.length
dataT.each { |d| p d }

dataT_vectors_in_hash = Hash[ dataT.map {|d| ["d#{dataT.index(d)}", d.to_scale]} ]
#p dataT_vectors_in_hash

ds = dataT_vectors_in_hash.to_dataset
#puts "====== ds ======"
#p ds

cor_matrix=Statsample::Bivariate.correlation_matrix(ds)
#puts "====== cor_matrix ======"
#p cor_matrix
pca=Statsample::Factor::PCA.new(cor_matrix)
#puts "====== pca ======"
#p pca

puts "====== pca.m ======"
p pca.m
#puts "====== pca.eigenvalues ======"
#p pca.eigenvalues 
#puts "====== pca.component_matrix ======"
#p pca.component_matrix 
#puts "====== pca.communalities ======"
#p pca.communalities

puts "====== pca.eigenvectors ======"
pca.eigenvectors.each { |d| p d }

puts "====== pca.eigenvectors.length ======"
p pca.eigenvectors.length

tranArray = []
pca.eigenvectors.length.times do |i|
  item = []
  pca.m.times do |j|
    item << pca.eigenvectors[i][j]
  end
  tranArray << item 
end
puts "====== tranArray ======"
tranArray.each { |d| p d }

tranMatrix = Matrix.rows(tranArray)
#puts "====== tranMatrix ======"
#p tranMatrix

puts "====== new data ======"
# 1x2 = (1x4) x (4x2)
data.each_with_index do |d, i|
  new = Matrix[d]*tranMatrix
  puts "##{i}:\t#{d}\t=>\t#{new}"
end
