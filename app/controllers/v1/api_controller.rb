class V1::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token #ignore csfr check

  # GET /v1/documents
  def show_documents
    @documents = Document.all

    render json: @documents
  end

  # GET /v1/documents/:document_id
  def show_document
    @document = Document.find_by_id(params[:document_id])
    render json: @document
  end

  # GET /v1/documents/:document_id/annotations
  def show_annotations
    @annotations = Document.find_by_id(params[:document_id]).annotations

    render json: @annotations
  end

  # GET /v1/annotations/:annotation_id
  def show_annotation
    @annotation = Annotation.find_by_id(params[:annotation_id])

    render json: @annotation
  end

  # POST /v1/documents/:document_id/annotations
  def new_annotation
    params[:annotation][:document_id] = params[:document_id];
    @annotation = Annotation.new(params[:annotation])

    if @annotation.save
      render json: @annotation, status: :created, location: @annotation 
    else
      render json: @annotation.errors, status: :unprocessable_entity
    end
  end

  # PUT /v1/annotations/:annotation_id
  def update_annotation
    @annotation = Annotation.find_by_id(params[:annotation_id])

    if @annotation.update_attributes(params[:annotation])
      render json: @annotation, status: :accepted, location: @annotation 
    else
      render json: @annotation.errors, status: :unprocessable_entity
    end
  end


  # Documents
  # Title, Body

  # Annotations
  # New - Article Number, Name, Comment,





end
