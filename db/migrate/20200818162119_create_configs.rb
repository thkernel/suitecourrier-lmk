class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.string :smtp_host
      t.string :smtp_user_name
      t.string :smtp_user_password
      t.string :smtp_domain
      t.string :smtp_address
      t.integer :smtp_port
      t.string :smtp_authentification
      t.boolean :smtp_enable_starttls_auto
      t.boolean :smtp_ssl
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
