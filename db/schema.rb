# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_21_162849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_logs", force: :cascade do |t|
    t.string "uid"
    t.bigint "user_id"
    t.string "browser"
    t.string "ip_address"
    t.string "controller"
    t.string "action"
    t.string "params"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "arrival_mails", force: :cascade do |t|
    t.string "uid"
    t.bigint "register_id"
    t.string "internal_reference"
    t.string "external_reference"
    t.datetime "departure_date"
    t.datetime "receipt_date"
    t.string "linked_to_mail"
    t.string "reference_linked_mail"
    t.string "to_answer"
    t.datetime "response_limit_time"
    t.datetime "response_date"
    t.bigint "support_id"
    t.bigint "mail_type_id"
    t.boolean "confidential"
    t.bigint "correspondent_id"
    t.string "object"
    t.text "description"
    t.string "reserved_suite"
    t.bigint "priority_id"
    t.bigint "folder_id"
    t.bigint "processing_entity_id"
    t.datetime "processing_deadline"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_id"], name: "index_arrival_mails_on_correspondent_id"
    t.index ["folder_id"], name: "index_arrival_mails_on_folder_id"
    t.index ["mail_type_id"], name: "index_arrival_mails_on_mail_type_id"
    t.index ["priority_id"], name: "index_arrival_mails_on_priority_id"
    t.index ["processing_entity_id"], name: "index_arrival_mails_on_processing_entity_id"
    t.index ["register_id"], name: "index_arrival_mails_on_register_id"
    t.index ["support_id"], name: "index_arrival_mails_on_support_id"
    t.index ["user_id"], name: "index_arrival_mails_on_user_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "status"
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "correspondent_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_correspondent_types_on_user_id"
  end

  create_table "correspondents", force: :cascade do |t|
    t.string "uid"
    t.bigint "correspondent_type_id"
    t.string "organization_name"
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.string "contact_civility"
    t.string "address"
    t.string "contact_phone"
    t.string "phone"
    t.string "city"
    t.string "country"
    t.string "zip_code"
    t.string "email"
    t.string "contact_email"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_type_id"], name: "index_correspondents_on_correspondent_type_id"
    t.index ["user_id"], name: "index_correspondents_on_user_id"
  end

  create_table "departure_mails", force: :cascade do |t|
    t.string "uid"
    t.bigint "register_id"
    t.string "internal_reference"
    t.datetime "departure_date"
    t.string "linked_to_mail"
    t.string "reference_linked_mail"
    t.string "to_answer"
    t.datetime "response_limit_time"
    t.datetime "response_date"
    t.bigint "support_id"
    t.bigint "mail_type_id"
    t.boolean "confidential"
    t.bigint "correspondent_id"
    t.bigint "initiating_entity_id"
    t.bigint "processing_entity_id"
    t.string "object"
    t.text "description"
    t.bigint "priority_id"
    t.bigint "folder_id"
    t.datetime "processing_deadline"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_id"], name: "index_departure_mails_on_correspondent_id"
    t.index ["folder_id"], name: "index_departure_mails_on_folder_id"
    t.index ["initiating_entity_id"], name: "index_departure_mails_on_initiating_entity_id"
    t.index ["mail_type_id"], name: "index_departure_mails_on_mail_type_id"
    t.index ["priority_id"], name: "index_departure_mails_on_priority_id"
    t.index ["processing_entity_id"], name: "index_departure_mails_on_processing_entity_id"
    t.index ["register_id"], name: "index_departure_mails_on_register_id"
    t.index ["support_id"], name: "index_departure_mails_on_support_id"
    t.index ["user_id"], name: "index_departure_mails_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.bigint "support_id"
    t.bigint "mail_type_id"
    t.datetime "departure_date"
    t.datetime "receipt_date"
    t.bigint "correspondent_id"
    t.bigint "initiating_entity_id"
    t.bigint "processing_entity_id"
    t.datetime "processing_deadline"
    t.bigint "folder_id"
    t.string "object"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_id"], name: "index_documents_on_correspondent_id"
    t.index ["folder_id"], name: "index_documents_on_folder_id"
    t.index ["initiating_entity_id"], name: "index_documents_on_initiating_entity_id"
    t.index ["mail_type_id"], name: "index_documents_on_mail_type_id"
    t.index ["processing_entity_id"], name: "index_documents_on_processing_entity_id"
    t.index ["support_id"], name: "index_documents_on_support_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "uid"
    t.bigint "parent_entity_id"
    t.bigint "entity_type_id"
    t.string "name"
    t.string "short_name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type_id"], name: "index_entities_on_entity_type_id"
    t.index ["parent_entity_id"], name: "index_entities_on_parent_entity_id"
    t.index ["user_id"], name: "index_entities_on_user_id"
  end

  create_table "entity_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entity_types_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "subject_class"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "path"
    t.text "description"
    t.string "status"
    t.bigint "parent_folder_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_folder_id"], name: "index_folders_on_parent_folder_id"
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "general_settings", force: :cascade do |t|
    t.string "application_name"
    t.string "login_screen_message"
    t.string "home_screen_message"
    t.string "logo"
    t.string "wallpaper"
    t.string "folder_prefix"
    t.string "folder_suffix"
    t.string "arrival_mail_reference_format"
    t.string "departure_mail_reference_format"
    t.string "document_reference_format"
    t.string "internal_memo_reference_format"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_general_settings_on_user_id"
  end

  create_table "imputation_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "task_type_id"
    t.bigint "task_id"
    t.string "title"
    t.bigint "priority_id"
    t.datetime "due_date"
    t.datetime "start_date"
    t.datetime "completed_date"
    t.bigint "task_status_id"
    t.text "notes"
    t.string "status"
    t.bigint "imputation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imputation_id"], name: "index_imputation_items_on_imputation_id"
    t.index ["priority_id"], name: "index_imputation_items_on_priority_id"
    t.index ["task_id"], name: "index_imputation_items_on_task_id"
    t.index ["task_status_id"], name: "index_imputation_items_on_task_status_id"
    t.index ["task_type_id"], name: "index_imputation_items_on_task_type_id"
  end

  create_table "imputations", force: :cascade do |t|
    t.string "uid"
    t.string "imputable_type"
    t.bigint "imputable_id"
    t.bigint "entity_id"
    t.bigint "recipient_id"
    t.datetime "viewed_at"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_imputations_on_entity_id"
    t.index ["imputable_type", "imputable_id"], name: "index_imputations_on_imputable_type_and_imputable_id"
    t.index ["recipient_id"], name: "index_imputations_on_recipient_id"
    t.index ["user_id"], name: "index_imputations_on_user_id"
  end

  create_table "internal_memos", force: :cascade do |t|
    t.string "uid"
    t.bigint "support_id"
    t.bigint "mail_type_id"
    t.bigint "priority_id"
    t.bigint "correspondent_id"
    t.bigint "initiating_entity_id"
    t.bigint "processing_entity_id"
    t.datetime "processing_deadline"
    t.boolean "confidential"
    t.bigint "folder_id"
    t.string "object"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_id"], name: "index_internal_memos_on_correspondent_id"
    t.index ["folder_id"], name: "index_internal_memos_on_folder_id"
    t.index ["initiating_entity_id"], name: "index_internal_memos_on_initiating_entity_id"
    t.index ["mail_type_id"], name: "index_internal_memos_on_mail_type_id"
    t.index ["priority_id"], name: "index_internal_memos_on_priority_id"
    t.index ["processing_entity_id"], name: "index_internal_memos_on_processing_entity_id"
    t.index ["support_id"], name: "index_internal_memos_on_support_id"
    t.index ["user_id"], name: "index_internal_memos_on_user_id"
  end

  create_table "mail_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mail_types_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "nature"
    t.bigint "recipient_id"
    t.text "content"
    t.string "status"
    t.datetime "readed_at"
    t.string "notificable_type"
    t.bigint "notificable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
  end

  create_table "organization_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organization_types_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.bigint "organization_type_id"
    t.string "slogan"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "phone"
    t.string "fax"
    t.string "zip_code"
    t.string "web_site"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_type_id"], name: "index_organizations_on_organization_type_id"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "permission_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "permission_id"
    t.string "action_name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_permission_items_on_permission_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "uid"
    t.bigint "feature_id"
    t.bigint "role_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_permissions_on_feature_id"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "color"
    t.integer "processing_time_in_days"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_priorities_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "uid"
    t.string "civility"
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "address"
    t.string "phone"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "register_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "short_name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_register_types_on_user_id"
  end

  create_table "registers", force: :cascade do |t|
    t.string "uid"
    t.bigint "register_type_id"
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "reference"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["register_type_id"], name: "index_registers_on_register_type_id"
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smtp_server_settings", force: :cascade do |t|
    t.string "delivery_method"
    t.string "authentication_method"
    t.string "host"
    t.integer "port"
    t.string "authentication"
    t.string "user_name"
    t.string "password"
    t.string "sending_address"
    t.string "domain"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_smtp_server_settings_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "storage_areas", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "short_name"
    t.integer "maximum_size"
    t.string "path"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_storage_areas_on_user_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_supports_on_user_id"
  end

  create_table "task_statuses", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_task_statuses_on_user_id"
  end

  create_table "task_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_task_types_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "uid"
    t.bigint "task_type_id"
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_type_id"], name: "index_tasks_on_task_type_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ticket_types_on_user_id"
  end

  create_table "ticket_users", force: :cascade do |t|
    t.string "uid"
    t.bigint "ticket_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_ticket_users_on_recipient_id"
    t.index ["ticket_id"], name: "index_ticket_users_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "uid"
    t.bigint "ticket_type_id"
    t.string "title"
    t.bigint "priority_id"
    t.text "content"
    t.datetime "due_date"
    t.datetime "start_date"
    t.datetime "completed_date"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priority_id"], name: "index_tickets_on_priority_id"
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "user_entities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_entities_on_user_id"
  end

  create_table "user_entity_items", force: :cascade do |t|
    t.bigint "user_entity_id"
    t.bigint "entity_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_user_entity_items_on_entity_id"
    t.index ["user_entity_id"], name: "index_user_entity_items_on_user_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "login"
    t.string "slug"
    t.bigint "role_id", null: false
    t.integer "created_by"
    t.string "status"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_logs", "users"
  add_foreign_key "arrival_mails", "correspondents"
  add_foreign_key "arrival_mails", "folders"
  add_foreign_key "arrival_mails", "mail_types"
  add_foreign_key "arrival_mails", "priorities"
  add_foreign_key "arrival_mails", "registers"
  add_foreign_key "arrival_mails", "supports"
  add_foreign_key "arrival_mails", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "correspondent_types", "users"
  add_foreign_key "correspondents", "correspondent_types"
  add_foreign_key "correspondents", "users"
  add_foreign_key "departure_mails", "correspondents"
  add_foreign_key "departure_mails", "folders"
  add_foreign_key "departure_mails", "mail_types"
  add_foreign_key "departure_mails", "priorities"
  add_foreign_key "departure_mails", "registers"
  add_foreign_key "departure_mails", "supports"
  add_foreign_key "departure_mails", "users"
  add_foreign_key "documents", "correspondents"
  add_foreign_key "documents", "folders"
  add_foreign_key "documents", "mail_types"
  add_foreign_key "documents", "supports"
  add_foreign_key "documents", "users"
  add_foreign_key "entities", "entity_types"
  add_foreign_key "entities", "users"
  add_foreign_key "entity_types", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "general_settings", "users"
  add_foreign_key "imputation_items", "imputations"
  add_foreign_key "imputation_items", "priorities"
  add_foreign_key "imputation_items", "task_statuses"
  add_foreign_key "imputation_items", "task_types"
  add_foreign_key "imputation_items", "tasks"
  add_foreign_key "imputations", "entities"
  add_foreign_key "imputations", "users"
  add_foreign_key "internal_memos", "correspondents"
  add_foreign_key "internal_memos", "folders"
  add_foreign_key "internal_memos", "mail_types"
  add_foreign_key "internal_memos", "priorities"
  add_foreign_key "internal_memos", "supports"
  add_foreign_key "internal_memos", "users"
  add_foreign_key "mail_types", "users"
  add_foreign_key "organization_types", "users"
  add_foreign_key "organizations", "organization_types"
  add_foreign_key "organizations", "users"
  add_foreign_key "permission_items", "permissions"
  add_foreign_key "permissions", "features"
  add_foreign_key "permissions", "roles"
  add_foreign_key "priorities", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "register_types", "users"
  add_foreign_key "registers", "register_types"
  add_foreign_key "registers", "users"
  add_foreign_key "smtp_server_settings", "users"
  add_foreign_key "statuses", "users"
  add_foreign_key "storage_areas", "users"
  add_foreign_key "supports", "users"
  add_foreign_key "task_statuses", "users"
  add_foreign_key "task_types", "users"
  add_foreign_key "tasks", "task_types"
  add_foreign_key "tasks", "users"
  add_foreign_key "ticket_types", "users"
  add_foreign_key "ticket_users", "tickets"
  add_foreign_key "tickets", "priorities"
  add_foreign_key "tickets", "ticket_types"
  add_foreign_key "tickets", "users"
  add_foreign_key "user_entities", "users"
  add_foreign_key "user_entity_items", "entities"
  add_foreign_key "user_entity_items", "user_entities"
  add_foreign_key "users", "roles"
end
