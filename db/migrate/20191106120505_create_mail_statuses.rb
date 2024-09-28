class CreateMailStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :mail_statuses do |t|
      t.string :name
      t.string :uid
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
