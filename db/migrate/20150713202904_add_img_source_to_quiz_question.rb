class AddImgSourceToQuizQuestion < ActiveRecord::Migration
  def change
    add_column :quiz_questions, :imgSource, :string
  end
end
