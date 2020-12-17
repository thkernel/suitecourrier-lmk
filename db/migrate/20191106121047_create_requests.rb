class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :uid
      t.references :request_type, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.datetime :born_date
      t.string :born_place
      t.string :academic_year
      t.string :grade
      t.string :specialty
      t.datetime :request_date
      t.text :description
      t.text :identification_number
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
