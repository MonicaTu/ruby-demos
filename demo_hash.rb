#!/usr/bin/env ruby

@entries = [
    [2009, 8, 1],
    [2009, 8, 2],
    [2009, 9, 3],
    [2007, 10, 5]]

years = Hash.new
@entries.each { |e|
    year = e[0]
    month = e[1]
    entry = e[2]

    #Add to years array
    years[year] ||= Hash.new
    years[year][month] ||= Array.new
    years[year][month] << entry
}
#puts years.inspect # {2009=>{8=>[1, 2], 9=>[3]}, 2007=>{10=>[5]}}

#a= Hash.new
#a[[1,2]]= 23
#a[[5,6]]= 42
#puts a

b= Hash.new
b["t1"]= 23
b["t2"]= 42
#puts b

c= Hash.new
c["t1"]= 203
c["t2"]= 402
#puts c

d= Hash.new
d["gene1"]= b 
d["gene2"]= c 
#puts d

    #Add to e array
    e= Hash.new
    e["gene1"] ||= Hash.new
    e["gene1"]["t1"] ||= 23 #Array.new
#    e["gene1"]["t1"] << 23
    e["gene1"] ||= Hash.new
    e["gene1"]["t2"] ||= 42 #Array.new
#    e["gene1"]["t2"] << 42
    e["gene2"] ||= Hash.new
    e["gene2"]["t1"] ||= 203 #Array.new
#    e["gene2"]["t1"] << 203
    e["gene2"] ||= Hash.new
    e["gene2"]["t2"] ||= 402 #Array.new
#    e["gene2"]["t2"] << 402
    puts e

#my_hash = {:a => 5}
#my_hash[:key] = "value"
#puts my_hash
#p my_hash

#window = {}
#5.times do |i|
#  window["my_new_array_#{i}"]=[i]
#end
#p window
