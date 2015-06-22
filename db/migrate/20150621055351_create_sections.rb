class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :name
      t.text :content
      t.text :contentType
      t.references :chapter, index: true

      t.timestamps null: false
    end
    add_foreign_key :sections, :chapters
  end
end
