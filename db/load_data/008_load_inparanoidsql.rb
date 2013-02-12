#=== conf ===
sqltab = "sqltable.Hf-Hc"
table = "inparanoid_hf_hc_groups"
#===                                                                               

$railsdir = "#{File.dirname(__FILE__)}/../../"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
sqltabf = "#{srcd}/#{sqltab}"


queryidf ="#{$railsdir}/db/load_data/orf_model_ids.txt"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = Time.now.utc
     
queryid = {}
File.open(queryidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  queryid[a[1]] = a[0].to_i
end


o = File.open(outf, "w")
STDERR.puts "sql is being saved as '#{outf}'"
File.open(sqltabf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/, -1)
  grp = a[0].to_i
  score = a[1].to_i
  species = a[2]
  confidence = a[3].to_f
  name = a[4] 
  if species == "Hf"
    id = queryid[name]
  else
    id = nil
  end
  if a[5]
    bs = a[5].sub(/%$/, '').to_i
  else
    bs = nil
  end
#  a.size

#  if a.size == 14
    # do nothing
#  elsif a.size == 12
    # do nothing
#  else
#    p a.size
#    p a
#    raise 
#    next
#  end

#  data = a.dup

  colnames = %w{ grp score species confidence gene bootstrap orf_model_id }

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} ("
  sql << colnames.join(", ")
  sql << ") "
  sql << " VALUES ( "

  values = [grp, score, species, confidence, name, bs]
  values << id

#  values.each do |v|
#    raise if v.to_s.size > 255
#  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
