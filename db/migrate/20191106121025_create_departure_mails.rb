class CreateDepartureMails < ActiveRecord::Migration[5.2]
  def change
    create_table :departure_mails do |t|
      t.string :uid
      t.references :register, foreign_key: true
      t.string :internal_reference, unique: true
     
      
      t.datetime :departure_date
      
      t.string :linked_to_mail
      t.string :reference_linked_mail

      t.string :to_answer
      t.datetime :response_limit_time
      t.datetime :response_date

      
      t.references :support, foreign_key: true
      t.references :nature, foreign_key: true
      t.boolean :confidential

      t.references :correspondent, foreign_key: true
      t.references :initiating_entity, index: true
      t.references :processing_entity, index: true
      
      t.string :object
      t.text :description
      t.references :priority, foreign_key: true
      t.references :folder, foreign_key: true

      t.datetime :processing_deadline
      t.string :status
      t.integer :year
      t.references :user, foreign_key: true

      

      t.timestamps
    end
  end
end
