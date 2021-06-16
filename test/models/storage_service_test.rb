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

require 'test_helper'

class StorageServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
