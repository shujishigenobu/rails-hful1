#=== Conf ===
fasta = "Trinity_h.fasta.cdest097aS70aL00.fa"
table = "transcript_models"
#===

$railsdir = "#{File.dirname(__FILE__)}/../../"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
fastaf = "#{srcd}/#{fasta}"




def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = Time.now.utc
     
# queryid = {}
#File.open(queryidf).each do |l|
#  next if /^\#/.match(l)
#  a = l.chomp.split(/\t/)
#  queryid[a[1]] = a[0]
#end

# queryid


o = File.open(outf, "w")
STDERR.puts "sql is being saved as '#{outf}'"

require 'rubygems'
require 'bio'
include Bio
FlatFile.open(FastaFormat, fastaf).each do |fas|
  name = fas.entry_id
  description = fas.definition
#  seq = fas.seq
  seq = nil
  len = fas.seq.length

  colnames = %w{ name description seq len }

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} ("
  sql << colnames.join(", ")
  sql << ") "
  sql << " VALUES ( "

  values = [name, description, seq, len]

#  values.each do |v|
#    raise if v.to_s.size > 255
#  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
