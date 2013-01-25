class Document < ActiveRecord::Base
  attr_accessible :body, :name, :epub
  has_attached_file :epub

  has_many :annotations
end
