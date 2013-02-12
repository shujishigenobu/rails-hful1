#=== conf ===
blast = "Hful.orf.130207s1.pep.vs.Hcit.orf.130207s1.pep.blast.fmt7.txt"
table = "blastp_hcit_results"
#===                                                                               

$railsdir = "#{File.dirname(__FILE__)}/../../"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/#{blast}"


queryidf ="#{$railsdir}/db/load_data/orf_model_ids.txt"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = Time.now.utc
     
queryid = {}
File.open(queryidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  queryid[a[1]] = a[0]
end


o = File.open(outf, "w")
STDERR.puts "sql is being saved as '#{outf}'"
File.open(blastf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/, -1)
  name = a[0]
  id = queryid[name]

  a.size

  if a.size == 14
    # do nothing
  elsif a.size == 12
    # do nothing
  else
    p a.size
    p a
    raise 
    next
  end

  data = a.dup

  colnames = %w{ q_seqid s_seqid pident alnlength mismatch gapopen q_start q_end s_start s_end evalue bitscore 
    q_len s_len
    orf_model_id }

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} ("
  sql << colnames.join(", ")
  sql << ") "
  sql << " VALUES ( "

  values = data[0..13]
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
