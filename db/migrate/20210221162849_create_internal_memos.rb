class CreateInternalMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :internal_memos do |t|
      t.string :uid
      t.references :support, foreign_key: true
      t.references :mail_type, foreign_key: true
      t.references :priority, foreign_key: true

      #t.datetime :departure_date
      #t.datetime :receipt_date

      t.references :correspondent, foreign_key: true
      t.references :initiating_entity, index: true
      t.references :processing_entity, index: true
      t.datetime :processing_deadline
      t.boolean :confidential

      t.references :folder, foreign_key: true
      t.string :object
      t.text :description
      t.string :status
      t.integer :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
