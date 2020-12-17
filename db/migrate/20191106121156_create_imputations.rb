class CreateImputations < ActiveRecord::Migration[5.2]
  def change
    create_table :imputations do |t|
      t.string :uid
      #t.references :imputation_reason, foreign_key: true
      #t.string :reference, unique: true
      t.references :imputable, polymorphic: true
      t.references :direction, foreign_key: true
      t.references :division, foreign_key: true
      t.references :service, foreign_key: true
      t.references :recipient, index: true
      t.datetime :viewed_at
      #t.references :arrival_mail, foreign_key: true
      t.string :status
      #t.references :sender, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
