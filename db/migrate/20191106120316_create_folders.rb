class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.string :uid
      t.string :name
      t.string :path
      t.text :description
      t.string :status
      t.references :parent, index: true
      t.string :google_drive_parent_id
      t.string :google_drive_file_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
