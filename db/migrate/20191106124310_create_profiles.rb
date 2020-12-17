class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :uid
      t.string :civility
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :address
      t.string :phone
      t.text :description
      t.string :status
      t.references :service, foreign_key: true
      t.references :direction, foreign_key: true
      t.references :division, foreign_key: true
      #t.integer :company_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
