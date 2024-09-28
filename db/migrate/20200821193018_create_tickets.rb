class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :uid
      t.string :reference
      t.references :ticket_type, foreign_key: true
      t.string :title
      t.references :ticket_priority, foreign_key: true
      t.text :content
      t.date :due_date
      t.date :start_date
      t.date :completed_date
      t.references :ticket_status , foreign_key: true
      t.integer :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
