class OrfModelsController < ApplicationController
  # GET /orf_models
  # GET /orf_models.json
  def index

    num_items = 25

    if params[:q].blank?
      @orf_models = OrfModel.paginate(page: params[:page], per_page: num_items)
    else
      query = params[:q].strip
      case query
      when /^m\.\d+/
        @orf_models = OrfModel.paginate(page: params[:page], per_page: num_items,
                                        conditions: ["name = ?", params[:q]])
      when /^EOG5/
        res = Orthodb5Hit.where("orthgrp = '#{query}'")
        ids = res.map{|r| r.orf_model_id}
        @orf_models = OrfModel.paginate(page: params[:page], per_page: num_items,
                                        conditions: ["id in (?)", ids])
      when /^comp\d+/
        res = TranscriptModel.where("name = '#{query}'")
        ids = res.map{|r| r.orf_models}.flatten
        @orf_models = OrfModel.paginate(page: params[:page], per_page: num_items,
                                        conditions: ["id in (?)", ids])
      else
         @orf_models = []
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orf_models }
    end
  end

  # GET /orf_models/1
  # GET /orf_models/1.json
  def show
    @orf_model = OrfModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orf_model }
    end
  end


  def fasta_cds
    @orf_model = OrfModel.find(params[:id])
    @fasta = ">#{@orf_model.description}\n"
    @fasta << @orf_model.naseq.gsub(/.{,60}/, "\\0\n")
  end

  def fasta_pep
    @orf_model = OrfModel.find(params[:id])
    @fasta = ">#{@orf_model.description}\n"
    @fasta << @orf_model.aaseq.gsub(/.{,60}/, "\\0\n")
  end

  def blast_nr
    @orf_model = OrfModel.find(params[:id])
    @blast_lines = @orf_model.blast_nr_results
  end

  def parent_transcript
    @orf_model = OrfModel.find(params[:id])
    @transcript = @orf_model.transcript_model
  end

end
