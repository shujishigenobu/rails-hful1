$railsdir = "#{File.dirname(__FILE__)}/../../"

require "#{$railsdir}/config/environment.rb"

outf = "transcript_model_ids.txt"
o = File.open(outf, "w")

o.puts "\# " + %w{id name}.join("\t")

TranscriptModel.all.each do |c|
  o.puts [c.id, c.name].join("\t")
end

o.close

STDERR.puts "#{outf} generated"
