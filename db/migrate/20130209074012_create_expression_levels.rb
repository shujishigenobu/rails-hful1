class CreateExpressionLevels < ActiveRecord::Migration
  def change
    create_table :expression_levels do |t|
      t.string :name
      t.float  :idx12
      t.float  :idx2
      t.float  :idx4
      t.float :idx5
      t.float :idx6
      t.float :idx7
      t.integer :orf_model_id
    end
    add_index :expression_levels, :orf_model_id, :unique => true
  end
end
