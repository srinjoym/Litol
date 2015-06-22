class AddImageSourceToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :imageSource, :string
  end
end
