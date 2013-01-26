class AddAttachmentEpubToDocuments < ActiveRecord::Migration
  def change
    add_attachment :documents, :epub
  end
end