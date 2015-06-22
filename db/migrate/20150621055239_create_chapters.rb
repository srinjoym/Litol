class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :name
      t.text :overview
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :chapters, :courses
  end
end
