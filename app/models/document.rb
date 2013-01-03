class Document < ActiveRecord::Base
  attr_accessible :body, :name

  has_many :annotations
end
