class CreateJoinTableOrganizationCourse < ActiveRecord::Migration
  def change
    create_join_table :organizations, :courses do |t|
      # t.index [:organization_id, :course_id]
      # t.index [:course_id, :organization_id]
    end
  end
end
