class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.string :uid
      #t.references :register_type, foreign_key: true
      t.string :register_type
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :reference
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
