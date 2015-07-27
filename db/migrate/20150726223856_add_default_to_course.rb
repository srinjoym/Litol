class AddDefaultToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :default, :boolean
  end
end
