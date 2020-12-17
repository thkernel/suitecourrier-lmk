class CreateGoogleDriveStorageTables < ActiveRecord::Migration[5.2]
  def change
    create_table :drive_blobs do |t|
      
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false

      t.index [ :key ], unique: true
    end

    create_table :drive_attachments do |t|
      t.string     :name,     null: false
      t.references :attachable,   null: false, polymorphic: true
      t.references :drive_blob, foreign_key: true,    null: false

      t.datetime :created_at, null: false

      #t.index [ :attachable_type, :attachable_id, :name, :blob_id ], name: "index_google_drive_storage_attachments_uniqueness", unique: true
      #t.foreign_key :google_drive_storage_blobs, column: :blob_id
    end
  end
end
