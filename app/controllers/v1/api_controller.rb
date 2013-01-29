class V1::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token #ignore csfr check

  #############################
  # Index Methods
  #############################

  # GET /v1/documents
  def show_documents
    @documents = Document.all

    retVal = Array.new
    @documents.each {|document| retVal << hash_with_path(document) } 

    render json: retVal
  end

  # GET /v1/documents/:document_id/annotations
  def show_annotations
    @annotations = Document.find_by_id(params[:document_id]).annotations

    render json: @annotations
  end

  #############################
  # Document Methods
  #############################
  
  # GET /v1/documents/:document_id
  def show_document
    @document = Document.find_by_id(params[:document_id])
    render json: @document
  end

  # POST /v1/documents
  def new_document
    @document = Document.new(params[:document])

    if @document.save
      render json: @document, status: :created, location: @document 
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # PUT /v1/documents/:document_id
  def update_document
    @document = Document.find_by_id(params[:document_id])

    if @document.update_attributes(params[:document])
      render json: @document, status: :accepted, location: @document 
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  #############################
  # Annotation Methods
  #############################

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



  def hash_with_path(document)
     document.attributes.merge({document_url: request.host_with_port + document.epub.url})
  end

end
