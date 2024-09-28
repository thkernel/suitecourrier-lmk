class CreateProfiles < ActiveRecord::Migration[6.1]
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
      #t.references :entity_type, foreign_key: true
      t.references :entity, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
