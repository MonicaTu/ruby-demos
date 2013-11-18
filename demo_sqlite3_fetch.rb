#!/usr/bin/ruby

# ==========================================
# http://zetcode.com/db/sqliteruby/connect/
# ==========================================

require 'sqlite3'

begin
  db = SQLite3::Database.open "test.db"
  
  stm = db.prepare "SELECT * FROM Cars LIMIT 5" 
  rs = stm.execute 
  
  rs.each do |row|
  puts row.join "\s"
  end

  rescue SQLite3::Exception => e 
  puts "Exception occured"
  puts e
  ensure
  
  stm.close if stm
  db.close if db
end
