class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :Chapter, index: true

      t.timestamps null: false
    end
    add_foreign_key :quizzes, :Chapters
  end
end
