class Document < ActiveRecord::Base
  attr_accessible :body, :name, :epub
  has_attached_file :epub

  has_many :annotations

  before_post_process :set_content_type

  def set_content_type
    self.epub.instance_write(:content_type, MIME::Types.type_for(self.epub).to_s)
  end
  
end
