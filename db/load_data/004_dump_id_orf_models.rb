$railsdir = "#{File.dirname(__FILE__)}/../../"

require "#{$railsdir}/config/environment.rb"

outf = "orf_model_ids.txt"
STDERR.puts "IDs are being saved in #{outf}"

o = File.open(outf, "w")

o.puts "\# " + %w{id name}.join("\t")

OrfModel.all.each do |c|
  o.puts [c.id, c.name].join("\t")
end

o.close
STDERR.puts "Done."
