class CreateActiveCourses < ActiveRecord::Migration
  def change
    create_table :active_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :certification_complete

      t.timestamps null: false
    end
  end
end
