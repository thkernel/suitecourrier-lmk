class CreateUserEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_entities do |t|
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
