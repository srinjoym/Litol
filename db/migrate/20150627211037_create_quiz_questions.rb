class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.references :Quiz, index: true
      t.string :question
      t.string :correct_answer

      t.timestamps null: false
    end
    add_foreign_key :quiz_questions, :Quizzes
  end
end
