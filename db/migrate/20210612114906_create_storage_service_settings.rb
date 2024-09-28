class CreateStorageServiceSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_service_settings do |t|
      t.string :uid
      t.string :local_storage_service
      t.string :local_storage_root
      t.string :amazon_storage_service_name
      t.string :amazon_storage_access_key_id
      t.string :amazon_storage_secret_access_key
      t.string :amazon_storage_region_name
      t.string :amazon_storage_bucket_name
      t.string :google_storage_service_name
      t.string :google_storage_project_name
      t.string :google_storage_credentials
      t.string :google_storage_bucket_name
      t.string :microsoft_storage_service_name
      t.string :microsoft_storage_account_name
      t.string :microsoft_storage_access_key
      t.string :microsoft_storage_container_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
