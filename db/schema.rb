# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130212104858) do

  create_table "blast_nr_results", :force => true do |t|
    t.string  "q_seqid"
    t.string  "s_seqid"
    t.float   "pident"
    t.integer "alnlength"
    t.integer "mismatch"
    t.integer "gapopen"
    t.integer "q_start"
    t.integer "q_end"
    t.integer "s_start"
    t.integer "s_end"
    t.float   "evalue"
    t.float   "bitscore"
    t.integer "q_len"
    t.integer "s_len"
    t.text    "description"
    t.integer "taxid"
    t.string  "species"
    t.string  "common_name"
    t.integer "orf_model_id"
  end

  add_index "blast_nr_results", ["orf_model_id"], :name => "index_blast_nr_results_on_orf_model_id"
  add_index "blast_nr_results", ["q_seqid"], :name => "index_blast_nr_results_on_q_seqid"

  create_table "blastp_hcit_results", :force => true do |t|
    t.string  "q_seqid"
    t.string  "s_seqid"
    t.float   "pident"
    t.integer "alnlength"
    t.integer "mismatch"
    t.integer "gapopen"
    t.integer "q_start"
    t.integer "q_end"
    t.integer "s_start"
    t.integer "s_end"
    t.float   "evalue"
    t.float   "bitscore"
    t.integer "q_len"
    t.integer "s_len"
    t.integer "orf_model_id"
  end

  add_index "blastp_hcit_results", ["orf_model_id"], :name => "index_blastp_hcit_results_on_orf_model_id"
  add_index "blastp_hcit_results", ["q_seqid"], :name => "index_blastp_hcit_results_on_q_seqid"

  create_table "expression_levels", :force => true do |t|
    t.string  "name"
    t.float   "idx12"
    t.float   "idx2"
    t.float   "idx4"
    t.float   "idx5"
    t.float   "idx6"
    t.float   "idx7"
    t.integer "orf_model_id"
  end

  add_index "expression_levels", ["orf_model_id"], :name => "index_expression_levels_on_orf_model_id", :unique => true

  create_table "inparanoid_hf_hc_groups", :force => true do |t|
    t.integer "grp"
    t.integer "score"
    t.string  "species"
    t.float   "confidence"
    t.string  "gene"
    t.integer "bootstrap"
    t.integer "orf_model_id"
  end

  add_index "inparanoid_hf_hc_groups", ["gene"], :name => "index_inparanoid_hf_hc_groups_on_gene"
  add_index "inparanoid_hf_hc_groups", ["grp"], :name => "index_inparanoid_hf_hc_groups_on_grp"
  add_index "inparanoid_hf_hc_groups", ["orf_model_id"], :name => "index_inparanoid_hf_hc_groups_on_orf_model_id"
  add_index "inparanoid_hf_hc_groups", ["species"], :name => "index_inparanoid_hf_hc_groups_on_species"

  create_table "interpro_motifs", :force => true do |t|
    t.string  "name"
    t.string  "md5"
    t.integer "length"
    t.string  "analysis"
    t.string  "signature_acc"
    t.string  "signature_desc"
    t.integer "start"
    t.integer "stop"
    t.float   "score"
    t.string  "status"
    t.date    "date"
    t.string  "interpro_acc"
    t.string  "interpro_desc"
    t.string  "interpro_go"
    t.integer "orf_model_id"
  end

  add_index "interpro_motifs", ["interpro_acc"], :name => "index_interpro_motifs_on_interpro_acc"
  add_index "interpro_motifs", ["name"], :name => "index_interpro_motifs_on_name"
  add_index "interpro_motifs", ["orf_model_id"], :name => "index_interpro_motifs_on_orf_model_id"
  add_index "interpro_motifs", ["signature_acc"], :name => "index_interpro_motifs_on_signature_acc"

  create_table "orf_models", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.text    "naseq"
    t.text    "aaseq"
    t.integer "transcript_model_id"
  end

  add_index "orf_models", ["name"], :name => "index_orf_models_on_name", :unique => true
  add_index "orf_models", ["transcript_model_id"], :name => "index_orf_models_on_transcript_model_id"

  create_table "transcript_models", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.text    "seq"
    t.integer "len"
  end

  add_index "transcript_models", ["name"], :name => "index_transcript_models_on_name", :unique => true

end
