class CreateUserMilestones < ActiveRecord::Migration
  def change
    create_table :user_milestones do |t|
      t.references :user, index: true
      t.integer :chapter_id
      t.boolean :quiz_passed

      t.timestamps null: false
    end
    add_foreign_key :user_milestones, :users
  end
end
