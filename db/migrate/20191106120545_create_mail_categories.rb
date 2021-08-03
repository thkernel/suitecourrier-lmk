class CreateMailCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_categories do |t|
      t.string :name
      t.string :uid
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
