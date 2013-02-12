class BlastNrResult < ActiveRecord::Base
  attr_accessible :bitscore, :common_name, :description, :evalue, :gapopen, :length, :mismatch, :orf_model_id, :pident, :q_end, :q_len, :q_seqid, :q_start, :s_end, :s_len, :s_seqid, :s_start, :species, :taxid

  belongs_to :orf_model
  
end
