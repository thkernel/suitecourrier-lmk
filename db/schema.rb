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

ActiveRecord::Schema.define(version: 2020_10_14_141250) do

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
    t.bigint "nature_id"
    t.bigint "correspondent_id"
    t.string "object"
    t.text "description"
    t.string "reserved_suite"
    t.bigint "folder_id"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_id"], name: "index_arrival_mails_on_correspondent_id"
    t.index ["folder_id"], name: "index_arrival_mails_on_folder_id"
    t.index ["nature_id"], name: "index_arrival_mails_on_nature_id"
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

  create_table "configs", force: :cascade do |t|
    t.string "smtp_host"
    t.string "smtp_user_name"
    t.string "smtp_user_password"
    t.string "smtp_domain"
    t.string "smtp_address"
    t.integer "smtp_port"
    t.string "smtp_authentification"
    t.boolean "smtp_enable_starttls_auto"
    t.boolean "smtp_ssl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "nature_id"
    t.bigint "correspondent_id"
    t.string "object"
    t.text "description"
    t.bigint "folder_id"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correspondent_id"], name: "index_departure_mails_on_correspondent_id"
    t.index ["folder_id"], name: "index_departure_mails_on_folder_id"
    t.index ["nature_id"], name: "index_departure_mails_on_nature_id"
    t.index ["register_id"], name: "index_departure_mails_on_register_id"
    t.index ["support_id"], name: "index_departure_mails_on_support_id"
    t.index ["user_id"], name: "index_departure_mails_on_user_id"
  end

  create_table "directions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_directions_on_user_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.bigint "direction_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direction_id"], name: "index_divisions_on_direction_id"
    t.index ["user_id"], name: "index_divisions_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.bigint "support_id"
    t.bigint "nature_id"
    t.bigint "folder_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_documents_on_folder_id"
    t.index ["nature_id"], name: "index_documents_on_nature_id"
    t.index ["support_id"], name: "index_documents_on_support_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "drive_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "attachable_type", null: false
    t.bigint "attachable_id", null: false
    t.bigint "drive_blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_drive_attachments_on_attachable_type_and_attachable_id"
    t.index ["drive_blob_id"], name: "index_drive_attachments_on_drive_blob_id"
  end

  create_table "drive_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_drive_blobs_on_key", unique: true
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
    t.bigint "parent_id"
    t.string "google_drive_parent_id"
    t.string "google_drive_file_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_folders_on_parent_id"
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "imputation_items", force: :cascade do |t|
    t.string "uid"
    t.string "title"
    t.text "description"
    t.datetime "due_date"
    t.datetime "start_date"
    t.datetime "completed_date"
    t.string "status"
    t.string "priority"
    t.bigint "imputation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imputation_id"], name: "index_imputation_items_on_imputation_id"
  end

  create_table "imputations", force: :cascade do |t|
    t.string "uid"
    t.string "imputable_type"
    t.bigint "imputable_id"
    t.bigint "direction_id"
    t.bigint "division_id"
    t.bigint "service_id"
    t.bigint "recipient_id"
    t.datetime "viewed_at"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direction_id"], name: "index_imputations_on_direction_id"
    t.index ["division_id"], name: "index_imputations_on_division_id"
    t.index ["imputable_type", "imputable_id"], name: "index_imputations_on_imputable_type_and_imputable_id"
    t.index ["recipient_id"], name: "index_imputations_on_recipient_id"
    t.index ["service_id"], name: "index_imputations_on_service_id"
    t.index ["user_id"], name: "index_imputations_on_user_id"
  end

  create_table "natures", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_natures_on_user_id"
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
    t.bigint "service_id"
    t.bigint "direction_id"
    t.bigint "division_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direction_id"], name: "index_profiles_on_direction_id"
    t.index ["division_id"], name: "index_profiles_on_division_id"
    t.index ["service_id"], name: "index_profiles_on_service_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "registers", force: :cascade do |t|
    t.string "uid"
    t.string "register_type"
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "reference"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "request_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_request_types_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "uid"
    t.bigint "request_type_id"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.datetime "born_date"
    t.string "born_place"
    t.string "academic_year"
    t.string "grade"
    t.string "specialty"
    t.datetime "request_date"
    t.text "description"
    t.text "identification_number"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_type_id"], name: "index_requests_on_request_type_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "uid"
    t.bigint "division_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_services_on_division_id"
    t.index ["user_id"], name: "index_services_on_user_id"
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

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "uid"
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
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
    t.string "title"
    t.string "priority"
    t.text "content"
    t.datetime "due_date"
    t.datetime "start_date"
    t.datetime "completed_date"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_logs", "users"
  add_foreign_key "arrival_mails", "correspondents"
  add_foreign_key "arrival_mails", "folders"
  add_foreign_key "arrival_mails", "natures"
  add_foreign_key "arrival_mails", "registers"
  add_foreign_key "arrival_mails", "supports"
  add_foreign_key "arrival_mails", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "correspondent_types", "users"
  add_foreign_key "correspondents", "correspondent_types"
  add_foreign_key "correspondents", "users"
  add_foreign_key "departure_mails", "correspondents"
  add_foreign_key "departure_mails", "folders"
  add_foreign_key "departure_mails", "natures"
  add_foreign_key "departure_mails", "registers"
  add_foreign_key "departure_mails", "supports"
  add_foreign_key "departure_mails", "users"
  add_foreign_key "directions", "users"
  add_foreign_key "divisions", "directions"
  add_foreign_key "divisions", "users"
  add_foreign_key "documents", "folders"
  add_foreign_key "documents", "natures"
  add_foreign_key "documents", "supports"
  add_foreign_key "documents", "users"
  add_foreign_key "drive_attachments", "drive_blobs"
  add_foreign_key "folders", "users"
  add_foreign_key "imputation_items", "imputations"
  add_foreign_key "imputations", "directions"
  add_foreign_key "imputations", "divisions"
  add_foreign_key "imputations", "services"
  add_foreign_key "imputations", "users"
  add_foreign_key "natures", "users"
  add_foreign_key "organization_types", "users"
  add_foreign_key "organizations", "organization_types"
  add_foreign_key "organizations", "users"
  add_foreign_key "permission_items", "permissions"
  add_foreign_key "permissions", "features"
  add_foreign_key "permissions", "roles"
  add_foreign_key "profiles", "directions"
  add_foreign_key "profiles", "divisions"
  add_foreign_key "profiles", "services"
  add_foreign_key "profiles", "users"
  add_foreign_key "registers", "users"
  add_foreign_key "request_types", "users"
  add_foreign_key "requests", "request_types"
  add_foreign_key "requests", "users"
  add_foreign_key "services", "users"
  add_foreign_key "supports", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tasks", "users"
  add_foreign_key "ticket_users", "tickets"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "roles"
end
