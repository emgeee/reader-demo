class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :position, :limit => 8
      t.integer :length, :limit => 8
      t.string :name
      t.text :comment
      t.integer :document_id

      t.timestamps
    end
  end
end
