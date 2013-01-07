class V1::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token #ignore csfr check

  # GET /v1/documents
  def show_documents
    @documents = Document.all

    render json: @documents
  end

  # GET /v1/documents
  def show_document
    @document = Document.find_by_id(params['document_id'])
    render json: @document
  end

  def show_annotations
    @annotations = Document.find_by_id(params['document_id']).annotations

    render json: @annotations
  end



  # Documents
  # Title, Body

  # Annotations
  # New - Article Number, Name, Comment,





end
