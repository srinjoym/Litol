class AddUserRefToQuizResults < ActiveRecord::Migration
  def change
    add_reference :quiz_results, :user, index: true
    add_foreign_key :quiz_results, :users
  end
end
