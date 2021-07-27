class CreateTicketPriorities < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_priorities do |t|
      t.string :uid
      t.string :name
      t.string :color
      t.integer :processing_time_in_days
      t.text :description
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
