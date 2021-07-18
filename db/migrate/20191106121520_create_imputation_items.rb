class CreateImputationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :imputation_items do |t|
      t.string :uid
      t.references :task_type, foreign_key: true, index: true
      #t.references :task, foreign_key: true
      t.string :title
      t.references :task_priority, foreign_key: true, index: true
      t.datetime :due_date
      t.datetime :start_date
      t.datetime :completed_date
      t.references :task_status, foreign_key: true, index: true
      t.text :description

      
      t.references :imputation, foreign_key: true, index: true

      t.timestamps
    end

    #add_index(:arrival_mail_imputation_items, :arrival_mail_imputation_id , :name => 'arrival_imputation_items_on_arrival_imputation_id')
  
  end
end
