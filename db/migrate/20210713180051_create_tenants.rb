class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :uid
      t.references :organization_type, foreign_key: true
      t.string :organization_name
      t.string :address
      t.string :phone
      t.string :country
      t.string :city
      t.string :email
      t.string :website
      t.string :subdomain
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
