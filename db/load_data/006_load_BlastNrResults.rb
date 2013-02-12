#=== conf ===                                                                                       
blast = "Hful.orf.130207s1.pep_ALL.fasta.vs.nr.blast.fmt6.ann2.txt"
#===                                                                                                
$railsdir = "#{File.dirname(__FILE__)}/../../"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/#{blast}"


queryidf ="#{$railsdir}/db/load_data/orf_model_ids.txt"

table = "blast_nr_results"

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
  a = l.chomp.split(/\t/, -1)
  name = a[0]
  id = queryid[name]

  a.size

  if a.size == 17
    # do nothing
  elsif a.size == 15
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
    description taxid species common_name orf_model_id}

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} ("
  sql << colnames.join(", ")
  sql << ") "
  sql << " VALUES ( "

  values = data[0..11]
  values <<  [nil, nil]
  values.flatten!
  (13..16).each do |n|
    values << data[n] 
  end
  values << id

p values.size unless values.size == 19

#  values.each do |v|
#    raise if v.to_s.size > 255
#  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
