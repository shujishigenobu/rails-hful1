#=== Conf ===                                                                                       
aafasta = "Hful.orf.130207s1.cds"
nafasta = "Hful.orf.130207s1.pep"

#===                                                                                                
$railsdir = "#{File.dirname(__FILE__)}/../../"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

include Bio
     
srcd = "#{$railsdir}/db/data_source"
aafastaf = "#{srcd}/#{aafasta}"
nafastaf = "#{srcd}/#{nafasta}"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = ActiveRecord::Base.connection.quote(Time.now.utc)
     
aafasta = {}
FlatFile.open(FastaFormat, aafastaf).each do |fas|
  aafasta[fas.entry_id] = fas
end

compidf ="#{$railsdir}/db/load_data/transcript_model_ids.txt"
compid = {}
File.open(compidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  compid[a[1]] = a[0]
end

STDERR.puts "#{aafasta.keys.size} entries found"

o = File.open(outf, "w")
STDERR.puts "sql was saved as '#{outf}'"
FlatFile.open(FastaFormat, nafastaf).each_with_index do |fas, i|
  name = quote(fas.entry_id)
  naseq = quote(fas.seq)
  aaseq = quote(aafasta.fetch(fas.entry_id).seq)
  definition = quote(fas.definition.strip)
  compname = /(comp\d+_c\d+_seq\d+):/.match(definition)[1]
  cid = compid.fetch(compname)

  sql = ""
  sql << "INSERT "
  sql << " INTO orf_models (name, description, naseq, aaseq, transcript_model_id) "
  sql << " VALUES ( #{name}, #{definition}, #{naseq}, #{aaseq}, #{cid} ) "
  sql << ";"
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
