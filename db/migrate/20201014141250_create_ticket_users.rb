class CreateTicketUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_users do |t|
      t.string :uid
      t.references :ticket, foreign_key: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
