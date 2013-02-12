class CreateInterproMotifs < ActiveRecord::Migration
  def change
    create_table :interpro_motifs do |t|
      t.string :name
      t.string :md5
      t.integer :length
      t.string :analysis
      t.string :signature_acc
      t.string :signature_desc
      t.integer :start
      t.integer :stop
      t.float  :score
      t.string :status
      t.date  :date
      t.string :interpro_acc
      t.string :interpro_desc
      t.string :interpro_go
      t.integer :orf_model_id
    end
    add_index :interpro_motifs, :orf_model_id
    add_index :interpro_motifs, :name
    add_index :interpro_motifs, :signature_acc
    add_index :interpro_motifs, :interpro_acc
  end
end
