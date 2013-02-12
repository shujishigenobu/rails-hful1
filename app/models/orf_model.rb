class OrfModel < ActiveRecord::Base
  attr_accessible :aaseq, :description, :name, :naseq, :transcript_model_id

  belongs_to :transcript_model

  has_one :expression_level
  has_one :orthodb5_hit
  has_one :inparanoid_hf_hc_group

  has_many :blast_nr_results
  has_many :interpro_motifs
  has_many :blastp_hcit_results

  def location_on_parent_transcript
    description.split[-1].split(/:/)[-1]
  end

  def model_type
  	 description.split[5].split(/:/)[1]
  end
end
