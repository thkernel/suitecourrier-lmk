class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :uid
      t.references :ticket_type, foreign_key: true
      t.string :title
      t.references :priority, foreign_key: true
      t.text :content
      t.datetime :due_date
      t.datetime :start_date
      t.datetime :completed_date
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
