class ExpressionLevel < ActiveRecord::Base
  attr_accessible :idx12, :idx2, :idx4, :idx5, :idx6, :idx7, :name, :orf_model_id

  belongs_to :orf_model
end
