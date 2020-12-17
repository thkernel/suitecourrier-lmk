class CreateImputationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :imputation_items do |t|
      t.string :uid
      t.string :title
      t.text :description
      #t.references :priority, foreign_key: true
      t.datetime :due_date
      t.datetime :start_date
      t.datetime :completed_date
      #t.references :task_status, foreign_key: true
      t.string :status
      t.string :priority
      t.references :imputation, foreign_key: true

      t.timestamps
    end

    #add_index(:arrival_mail_imputation_items, :arrival_mail_imputation_id , :name => 'arrival_imputation_items_on_arrival_imputation_id')
  
  end
end
