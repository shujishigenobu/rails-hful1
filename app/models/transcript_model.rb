class TranscriptModel < ActiveRecord::Base
  attr_accessible :description, :len, :name

  has_many :orf_models

  def self.blastdb
     "#{Rails.root}/db/data_source/blastdb/Trinity_h.fasta.cdest097aS70aL00.fa"
  end

  def seq
    require 'bio'
    cmd = "blastdbcmd -db #{TranscriptModel.blastdb} -entry #{name}"
    r = nil
    IO.popen(cmd){|io| r = io.read}
    fas = Bio::FastaFormat.new(r)
    fas.seq
  end


end
