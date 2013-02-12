class CreateInparanoidHfHcGroups < ActiveRecord::Migration
  def change
    create_table :inparanoid_hf_hc_groups do |t|
      t.integer :grp
      t.integer :score
      t.string  :species
      t.float   :confidence
      t.string  :gene
      t.integer :bootstrap
      t.integer :orf_model_id

    end

    add_index :inparanoid_hf_hc_groups, :grp
    add_index :inparanoid_hf_hc_groups, :species
    add_index :inparanoid_hf_hc_groups, :gene
    add_index :inparanoid_hf_hc_groups, :orf_model_id
    
  end
end
