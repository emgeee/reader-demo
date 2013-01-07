class Annotation < ActiveRecord::Base
  attr_accessible :comment, :length, :name, :position, :document_id

  belongs_to :documents
end
