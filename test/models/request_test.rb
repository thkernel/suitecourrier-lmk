# == Schema Information
#
# Table name: requests
#
#  id                    :bigint           not null, primary key
#  uid                   :string
#  request_type_id       :bigint
#  first_name            :string
#  last_name             :string
#  gender                :string
#  born_date             :datetime
#  born_place            :string
#  academic_year         :string
#  grade                 :string
#  specialty             :string
#  request_date          :datetime
#  description           :text
#  identification_number :text
#  status                :string
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
