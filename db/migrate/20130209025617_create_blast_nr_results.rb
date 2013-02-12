class CreateBlastNrResults < ActiveRecord::Migration
  def change
    create_table :blast_nr_results do |t|
      t.string :q_seqid
      t.string :s_seqid
      t.float  :pident
      t.integer :alnlength
      t.integer :mismatch
      t.integer :gapopen
      t.integer :q_start
      t.integer :q_end
      t.integer :s_start
      t.integer :s_end
      t.float  :evalue
      t.float  :bitscore
      t.integer :q_len
      t.integer :s_len
      t.text    :description
      t.integer :taxid
      t.string :species
      t.string :common_name

      t.integer :orf_model_id
    end
    add_index :blast_nr_results, :q_seqid
    add_index :blast_nr_results, :orf_model_id
  end
end
