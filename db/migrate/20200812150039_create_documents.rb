class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :uid
      t.string :slug
      t.references :support, foreign_key: true
      t.references :mail_type, foreign_key: true

      t.datetime :departure_date
      t.datetime :receipt_date

      t.references :correspondent, foreign_key: true
      t.references :initiating_entity, index: true
      t.references :processing_entity, index: true
      t.datetime :processing_deadline

      t.references :folder, foreign_key: true
      t.string :object
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
