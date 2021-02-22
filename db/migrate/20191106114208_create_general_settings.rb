class CreateGeneralSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :general_settings do |t|
      t.string :application_name
      t.string :login_screen_message
      t.string :home_screen_message
      t.string :logo
      t.string :wallpaper
      t.string :folder_prefix
      t.string :folder_suffix
      t.string :arrival_mail_reference_format
      t.string :departure_mail_reference_format
      t.string :document_reference_format
      t.string :internal_memo_reference_format


      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
