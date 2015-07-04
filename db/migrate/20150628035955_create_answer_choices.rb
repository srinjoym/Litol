class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :quiz_question_id
      t.string :answer
      t.string :letter

      t.timestamps null: false
    end
  end
end
