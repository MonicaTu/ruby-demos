#!/usr/bin/ruby

require 'spreadsheet'    

#new_hash = {}
#virtual_hash = {}

input_file = "/home/monica/workspace/bioinformatic/project1/dataset/File 2_Cho.xls_2012.xls"

book = Spreadsheet.open(input_file)
sheet1 = book.worksheet('Sheet1') # can use an index or worksheet name
sheet1.each do |row|
break if row[0].nil? # if first cell empty
    puts row.join(',') # looks like it calls "to_s" on each cell's Value
#    new_hash = {row[0] => {"t1" => row[1], "t2" => row[2], "t3" => row[3], "t4" => row[4], 
#               "t5" => row[5], "t6" => row[6], "t7" => row[7], "t8" => row[8], 
#               "t9" => row[9], "t11" => row[10], "t11" => row[11], "t12" => row[12], 
#               "t13" => row[13], "t14" => row[14], "t15" => row[15], "t16" => row[16], 
#               "t17" => row[17]}}
#    puts new_hash
#    virtual_hash = virtual_hash.merge(new_hash)
end
#puts virtual_hash
