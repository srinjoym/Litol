class AddLicenseToUser < ActiveRecord::Migration
  def change
    add_column :users, :license, :string
  end
end
