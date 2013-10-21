#!/usr/bin/env ruby

require 'kmeans/pair'
require 'kmeans/pearson'
require 'kmeans/cluster'

uniform_hash = {
"test01"=> {"hoge"=>0.14, "fuga"=>1.25, "piyo"=>0.36 },
"test02"=> {"hoge"=>2.14, "fuga"=>1.25, "piyo"=>3.36 },
"test03"=> {"hoge"=>3.14, "fuga"=>0.25, "piyo"=>1.36 },
"test04"=> {"hoge"=>0.14, "fuga"=>2.25, "piyo"=>0.36 },
"test05"=> {"hoge"=>4.14, "fuga"=>2.25, "piyo"=>3.36 },
"test06"=> {"hoge"=>3.14, "fuga"=>1.25, "piyo"=>1.36 }}

#uniform_hash = {}
#new_hash = {"test01"=> {"hoge"=>0, "fuga"=>1, "piyo"=>0 }}
#uniform_hash = uniform_hash.merge(new_hash)
#new_hash = {"test02"=> {"hoge"=>2, "fuga"=>1, "piyo"=>3 }}
#uniform_hash = uniform_hash.merge(new_hash)
#new_hash = {"test03"=> {"hoge"=>3, "fuga"=>0, "piyo"=>1 }}
#uniform_hash = uniform_hash.merge(new_hash)
#new_hash = {"test04"=> {"hoge"=>0, "fuga"=>2, "piyo"=>0 }}
#uniform_hash = uniform_hash.merge(new_hash)
#new_hash = {"test05"=> {"hoge"=>4, "fuga"=>2, "piyo"=>3 }}
#uniform_hash = uniform_hash.merge(new_hash)
#new_hash = {"test06"=> {"hoge"=>3, "fuga"=>1, "piyo"=>1 }}
#uniform_hash = uniform_hash.merge(new_hash)
#puts uniform_hash

#uniform_hash = {
#"YDL025C"=>{"t1"=>-0.1725, "t2"=>-0.5375, "t3"=>-0.497, "t4"=>-0.3818, "t5"=>-0.527, "t6"=>-0.426, "t7"=>-0.6929, "t8"=>-0.402, "t9"=>-0.3263, "t11"=>-0.3532, "t12"=>-0.2771, "t13"=>-0.2732, "t14"=>-0.3307, "t15"=>-0.466, "t16"=>-0.4314, "t17"=>-0.3135}, 
#"YKL032C"=>{"t1"=>-0.2364, "t2"=>0.0794, "t3"=>0.1678, "t4"=>0.2389, "t5"=>0.3847, "t6"=>0.2625, "t7"=>0.1889, "t8"=>0.2681, "t9"=>0.0363, "t11"=>-0.0521, "t12"=>-0.0307, "t13"=>0.0584, "t14"=>0.2817, "t15"=>0.2239, "t16"=>-0.0253, "t17"=>0.0751}, 
#"YJR150C"=>{"t1"=>-0.6929, "t2"=>-0.8948, "t3"=>-0.6405, "t4"=>-0.1023, "t5"=>0.1816, "t6"=>0.163, "t7"=>0.1657, "t8"=>0.1114, "t9"=>-0.0783, "t11"=>-0.1849, "t12"=>-0.402, "t13"=>-0.466, "t14"=>-0.4098, "t15"=>-0.5035, "t16"=>-0.6451, "t17"=>-0.7298}, 
#"YNL325C"=>{"t1"=>-0.4125, "t2"=>-0.4542, "t3"=>-0.5629, "t4"=>-0.3969, "t5"=>-0.5167, "t6"=>-0.5375, "t7"=>-0.4399, "t8"=>-0.4751, "t9"=>-0.472, "t11"=>-0.4073, "t12"=>-0.6061, "t13"=>-0.4843, "t14"=>-0.437, "t15"=>-0.46, "t16"=>-0.594, "t17"=>-0.5445}, "YER048C"=>{"t1"=>-0.1517, "t2"=>0.0081, "t3"=>-0.065, "t4"=>0.0021, "t5"=>-0.0275, "t6"=>-0.1277, "t7"=>-0.0921, "t8"=>-0.0475, "t9"=>-0.065, "t11"=>-0.0627, "t12"=>0.0345, "t13"=>-0.0396, "t14"=>0.0373, "t15"=>0.022, "t16"=>0.0122, "t17"=>-0.0545}, 
#"YPR097W"=>{"t1"=>-0.3156, "t2"=>-0.3578, "t3"=>-0.2225, "t4"=>-0.1195, "t5"=>-0.301, "t6"=>-0.2294, "t7"=>-0.3051, "t8"=>-0.249, "t9"=>-0.2157, "t11"=>-0.1849, "t12"=>-0.1849, "t13"=>-0.2008, "t14"=>-0.2694, "t15"=>-0.2311, "t16"=>-0.2752, "t17"=>-0.2364}, 
#"YNL098C"=>{"t1"=>0.1523, "t2"=>0.1376, "t3"=>0.0566, "t4"=>0.1435, "t5"=>0.1909, "t6"=>0.0673, "t7"=>0.0628, "t8"=>0.023, "t9"=>0.0977, "t11"=>0.2013, "t12"=>0.2, "t13"=>0.1587, "t14"=>0.1308, "t15"=>0.1255, "t16"=>0.2134, "t17"=>0.1686}}

#(0..10000).each do |i|
    result = Kmeans::Cluster.new(uniform_hash, {
            :centroids => 4,
            :loop_max => 100
            })
    result.make_cluster
    
    # The results differ for each run
    puts "---- Result -----"
    p result.cluster.values #=> [["test01", "test04"], ["test02"], ["test03", "test05"], ["test06"], []]
    p result.cluster.values[0]
    p result.cluster.values[1]
    p result.cluster.values[2]
    p result.cluster.values[3]
#end
