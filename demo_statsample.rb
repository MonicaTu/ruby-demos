#!/usr/bin/env ruby

require 'statsample'

a=[2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2.0, 1.0, 1.5, 1.1].to_scale
puts "====== a ======"
p a
b=[2.4,0.7,2.9,2.2,3.0,2.7,1.6,1.1,1.6,0.9].to_scale
puts "====== b ======"
p b
ds={'a'=>a,'b'=>b}.to_dataset
#puts "====== ds ======"
#p ds
cor_matrix=Statsample::Bivariate.correlation_matrix(ds)
puts "====== cor_matrix ======"
p cor_matrix
pca=Statsample::Factor::PCA.new(cor_matrix)
#puts "====== pca ======"
#p pca

#puts "====== pca.m ======"
#p pca.m #=> 1
#puts "====== pca.eigenvalues ======"
#p pca.eigenvalues #=> [1.92592927269225, 0.0740707273077545]
#puts "====== pca.component_matrix ======"
#p pca.component_matrix #=> GSL::Matrix[[9.813e-01], [9.813e-01]]
#puts "====== pca.communalities ======"
#p pca.communalities #=> [0.962964636346122, 0.962964636346122]

puts "====== pca.eigenvectors ======"
p pca.eigenvectors #=> [Vector[0.7071067811865475, 0.7071067811865475], Vector[0.7071067811865475, -0.7071067811865475]]

tranMatrix = pca.eigenvectors[0]
puts "====== tranMatrix ======"
p tranMatrix

a1 = a*tranMatrix
puts "====== a1 ======"
p a1

