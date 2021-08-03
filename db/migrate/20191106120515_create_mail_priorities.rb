class CreateMailPriorities < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_priorities do |t|
      t.string :name
      t.string :uid
      t.string :color
      t.integer :processing_time_in_days
      t.text :description
      t.string :status
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
