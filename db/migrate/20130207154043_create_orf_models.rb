class CreateOrfModels < ActiveRecord::Migration
  def change
    create_table :orf_models do |t|
      t.string  :name
      t.string  :description
      t.text    :naseq
      t.text    :aaseq
      t.integer :transcript_model_id
    end
    add_index :orf_models, :name, :unique => true
    add_index :orf_models, :transcript_model_id
  end
end
