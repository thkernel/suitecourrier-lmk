class CreateCorrespondents < ActiveRecord::Migration[5.2]
  def change
    create_table :correspondents do |t|
      t.string :uid
      t.references :correspondent_type, foreign_key: true
      t.string :organization_name
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_civility
      t.string :address
      t.string :contact_phone
      t.string :phone
      t.string :city
      t.string :country
      t.string :zip_code
      t.string :email  
      t.string :contact_email
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
