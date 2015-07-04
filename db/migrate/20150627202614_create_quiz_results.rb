class CreateQuizResults < ActiveRecord::Migration
  def change
    create_table :quiz_results do |t|
      t.integer :active_course_id
      t.integer :quiz_id
      t.boolean :passed
      t.integer :score
      t.integer :chapter_id
      t.datetime :time_passed

      t.timestamps null: false
    end
  end
end
