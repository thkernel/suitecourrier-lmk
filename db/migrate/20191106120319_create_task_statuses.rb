class CreateTaskStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :task_statuses do |t|
      t.string :uid
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
