class CreateArrivalMails < ActiveRecord::Migration[6.1]
  def change
    create_table :arrival_mails do |t|
      t.string :uid
      t.references :register, foreign_key: true

      t.string :internal_reference
      t.string :external_reference

      t.date :departure_date
      t.date :receipt_date

      t.string :linked_to_mail
      t.string :reference_linked_mail

      t.string :to_answer
      t.date :response_limit_time
      t.date :response_date

      t.references :support, foreign_key: true
      t.references :nature, foreign_key: true


      t.references :correspondent, foreign_key: true
      t.string :object
      t.text :description
      
      
      #t.string :reserved_suite
      
      t.references :folder, foreign_key: true

      # Mail processing
      t.references :processing_entity, index: true
      t.references :processing_recipient, index: true
      t.date :processing_deadline
      t.date :processing_date
      t.boolean :processed

      t.references :mail_priority, foreign_key: true
      t.references :mail_status, foreign_key: true, index: true
      t.references :mail_type, foreign_key: true, index: true
      t.references :mail_category, foreign_key: true, index: true

      t.integer :year
      t.references :user, foreign_key: true

      

      t.timestamps
    end
  end
end
