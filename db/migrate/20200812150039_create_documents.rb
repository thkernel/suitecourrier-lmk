class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :uid
      t.string :slug
      t.references :support, foreign_key: true
      t.references :nature, foreign_key: true
      t.references :folder, foreign_key: true
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
