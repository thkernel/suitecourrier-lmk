# == Schema Information
#
# Table name: storage_service_settings
#
#  id                               :bigint           not null, primary key
#  uid                              :string
#  local_storage_service            :string
#  local_storage_root               :string
#  amazon_storage_service_name      :string
#  amazon_storage_access_key_id     :string
#  amazon_storage_secret_access_key :string
#  amazon_storage_region_name       :string
#  amazon_storage_bucket_name       :string
#  google_storage_service_name      :string
#  google_storage_project_name      :string
#  google_storage_credentials       :string
#  google_storage_bucket_name       :string
#  microsoft_storage_service_name   :string
#  microsoft_storage_account_name   :string
#  microsoft_storage_access_key     :string
#  microsoft_storage_container_name :string
#  user_id                          :bigint
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

require 'test_helper'

class StorageServiceSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
