# == Schema Information
#
# Table name: register_types
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  short_name  :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RegisterTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
