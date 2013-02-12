class CreateTranscriptModels < ActiveRecord::Migration
  def change
    create_table :transcript_models do |t|
      t.string :name
      t.string :description
      t.text   :seq
      t.integer :len
    end
    add_index :transcript_models, :name, :unique => true
  end
end
