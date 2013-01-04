class V1::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token #ignore csfr check

  def show_documents
    
    @documents = Document.all

    render json: @documents
  end

  # Documents
  # Title, Body

  # Annotations
  # New - Article Number, Name, Comment,





end
