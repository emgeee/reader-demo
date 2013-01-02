class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :name
      t.text :body

      t.timestamps
    end
  end
end
