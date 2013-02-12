class InparanoidHfHcGroup < ActiveRecord::Base
  attr_accessible :bootstrap, :confidence, :gene, :group, :orf_model_id, :score, :species

  belongs_to :orf_model 

end
