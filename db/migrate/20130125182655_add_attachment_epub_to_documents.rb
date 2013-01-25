class AddAttachmentEpubToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.has_attached_file :epub
    end
  end

  def self.down
    drop_attached_file :documents, :epub
  end
end
