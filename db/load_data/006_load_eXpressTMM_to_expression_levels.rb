$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/130208-Hojo-DB/ntak11"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
cpmf = "#{srcd}/cpm_130207.txt"
queryidf ="#{$railsdir}/db/load_data/orf_model_ids.txt"


def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = ActiveRecord::Base.connection.quote(Time.now.utc)
     
queryid = {}
File.open(queryidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  queryid[a[1]] = a[0]
end

# p queryid


o = File.open(outf, "w")
STDERR.puts "sql is being saved as '#{outf}'"
File.open(cpmf).each_with_index do |l, i|
  next if /^idx/.match(l) && i == 0
  a = l.chomp.split(/\t/, -1)
  id = queryid[a[0]]

  sql = ""
  sql << "INSERT "
  sql << " INTO expression_levels (name, idx12, idx2, idx4, idx5, idx6, idx7, orf_model_id) "
  sql << " VALUES ( '#{a[0]}', #{a[1]}, #{a[2]}, #{a[3]}, #{a[4]}, #{a[5]}, #{a[6]}, #{id}) "
  sql << ";"
  o.puts sql 

end

o.close
