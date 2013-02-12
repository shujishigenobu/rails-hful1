class CreateBlastpHcitResults < ActiveRecord::Migration
  def change
    create_table :blastp_hcit_results do |t|
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

      t.integer :orf_model_id
    end
    add_index :blastp_hcit_results, :q_seqid
    add_index :blastp_hcit_results, :orf_model_id
  end
end
