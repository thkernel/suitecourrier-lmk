class CreateUserEntityItems < ActiveRecord::Migration[5.2]
  def change
    create_table :user_entity_items do |t|
      t.references :user_entity, foreign_key: true
      t.references :entity, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
