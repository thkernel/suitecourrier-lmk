class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :uid
      t.references :parent, index: true
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
