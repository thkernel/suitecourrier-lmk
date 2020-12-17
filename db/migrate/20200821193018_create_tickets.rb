class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :uid
      t.string :title
      t.string :priority
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
