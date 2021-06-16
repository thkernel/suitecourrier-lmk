# == Schema Information
#
# Table name: storage_services
#
#  id                         :bigint           not null, primary key
#  uid                        :string
#  storage_service_name       :string
#  storage_service_setting_id :bigint
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class StorageService < ApplicationRecord
  belongs_to :storage_service_setting
end
