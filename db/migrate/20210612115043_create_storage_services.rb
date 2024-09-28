class CreateStorageServices < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_services do |t|
      t.string :uid
      t.string :storage_service_name
      t.references :storage_service_setting, foreign_key: true

      t.timestamps
    end
  end
end
