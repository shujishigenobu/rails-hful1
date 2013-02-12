class BlastpHcitResult < ActiveRecord::Base
  attr_accessible :alnlength, :bitscore, :evalue, :g_apopen, :mismatch, :pident, :q_end, :q_len, :q_seqid, :q_start, :s_end, :s_len, :s_seqid, :s_start

  belongs_to :orf_model

end
