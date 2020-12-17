class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :nature
      t.references :recipient, index: true
      t.text :content
      t.string :status
      t.datetime :readed_at
      t.references :notificable, polymorphic: true
      t.timestamps
    end
  end
end
