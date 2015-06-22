class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :organizationName
      t.string :address
      t.string :licenseKey
      t.integer :numLicenses

      t.timestamps null: false
    end
  end
end
