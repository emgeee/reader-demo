class Document < ActiveRecord::Base
  attr_accessible :body, :name, :epub
  
  has_attached_file :epub,
    :path => ":rails_root/public/system/:attachment/:id/:normalized_file_name",
    :url => "/system/:attachment/:id/:normalized_file_name"

  has_many :annotations

  # Change epub file name
  Paperclip.interpolates :normalized_file_name do |attachment, style|
    attachment.instance.normalized_file_name
  end

  def normalized_file_name
    "#{self.id}-#{self.epub_file_name.gsub( /[^a-zA-Z0-9_\.]/, '_')}"
  end
  
end
