class CreateStorageAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :storage_areas do |t|
      t.string :uid
      t.string :name
      t.string :short_name
      t.integer :maximum_size
      t.string :path
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
