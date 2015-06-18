class AddClearanceToUser < ActiveRecord::Migration
  def change
  	add_column :users, :clearance, :int # 0: admin, 1: school, 2: user
  end
end
