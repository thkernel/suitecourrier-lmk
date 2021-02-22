class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :uid
      t.references :parent_entity, index: true
      t.references :entity_type, foreign_key: true
      t.string :name
      t.string :short_name
      t.string :phone
      t.string :email
      t.string :address
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
