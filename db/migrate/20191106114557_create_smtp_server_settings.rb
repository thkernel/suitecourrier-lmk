class CreateSmtpServerSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :smtp_server_settings do |t|
      t.string :delivery_method
      t.string :authentication_method
      t.string :host
      t.integer :port
      t.string :authentication
      t.string :user_name
      t.string :password
      t.string :sending_address
      t.string :domain
      t.boolean :enable_starttls_auto
      t.boolean :ssl
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
