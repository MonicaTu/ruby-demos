#!/usr/bin/env ruby

require 'statsample'

a=Matrix[[7, 26, 6, 60].to_scale]
b=Matrix[[1, 29, 15, 52].to_scale]
c=Matrix[[11, 56, 8, 20].to_scale]
d=Matrix[[11, 31, 8, 47].to_scale]
e=Matrix[[7, 52, 6, 33].to_scale]
f=Matrix[[11, 55, 9, 22].to_scale]
g=Matrix[[3, 71, 17, 6].to_scale]
h=Matrix[[1, 31, 22, 44].to_scale]
i=Matrix[[2, 54, 18, 22].to_scale]
j=Matrix[[21, 47, 4, 26].to_scale]
k=Matrix[[1, 40, 23, 34].to_scale]
l=Matrix[[11, 66, 9, 12].to_scale]
m=Matrix[[10, 68, 8, 12].to_scale]
#rds={'a'=>a,'b'=>b,'c'=>c,'d'=>d,'e'=>e,'f'=>f,'g'=>g,'h'=>h,'i'=>i,'j'=>j,'k'=>k,'l'=>l,'m'=>m}.to_dataset

c1 = [7, 1, 11, 11, 7, 11, 3, 1, 2, 21, 1, 11, 10].to_scale
c2 = [26, 29, 56, 31, 52, 55, 71, 31, 54, 47, 40, 66, 68].to_scale
c3 = [6, 15, 8, 8, 6, 9, 17, 22, 18, 4, 23, 9, 8].to_scale
c4 = [60, 52, 20, 47, 33, 22, 6, 44, 22, 26, 34, 12, 12].to_scale
cds={'c1'=>c1,'c2'=>c2,'c3'=>c3,'c4'=>c4}.to_dataset

#puts "====== cds ======"
#p cds
cor_matrix=Statsample::Bivariate.correlation_matrix(cds)
#puts "====== cor_matrix ======"
#p cor_matrix
pca=Statsample::Factor::PCA.new(cor_matrix)
#puts "====== pca ======"
#p pca

puts "====== pca.m ======"
p pca.m
puts "====== pca.eigenvalues ======"
p pca.eigenvalues 
#puts "====== pca.component_matrix ======"
#p pca.component_matrix 
#puts "====== pca.communalities ======"
#p pca.communalities

puts "====== pca.eigenvectors ======"
p pca.eigenvectors 

tranMatrix = Matrix[[pca.eigenvectors[0][0], pca.eigenvectors[0][1]],
                    [pca.eigenvectors[1][0], pca.eigenvectors[1][1]], 
                    [pca.eigenvectors[2][0], pca.eigenvectors[2][1]], 
                    [pca.eigenvectors[3][0], pca.eigenvectors[3][1]]] 
puts "====== tranMatrix ======"
p tranMatrix

# 1x2 = (1x4) x (4x2)
a1 = a*tranMatrix
puts "====== a1 ======"
p a, a1
b1 = b*tranMatrix
puts "====== b1 ======"
p b, b1
c1 = c*tranMatrix
puts "====== c1 ======"
p c, c1
d1 = d*tranMatrix
puts "====== d1 ======"
p d, d1
e1 = e*tranMatrix
puts "====== e1 ======"
p e, e1
puts "====== f1 ======"
f1 = f*tranMatrix
p f, f1
puts "====== g1 ======"
g1 = g*tranMatrix
p g, g1
puts "====== h1 ======"
h1 = h*tranMatrix
p h, h1
puts "====== i1 ======"
i1 = i*tranMatrix
p i, i1
puts "====== j1 ======"
j1 = j*tranMatrix
p j, j1
puts "====== k1 ======"
k1 = k*tranMatrix
p k, k1
puts "====== l1 ======"
l1 = l*tranMatrix
p l, l1
puts "====== m1 ======"
m1 = m*tranMatrix
p m, m1

