# == Schema Information
#
# Table name: priorities
#
#  id                      :bigint           not null, primary key
#  uid                     :string
#  name                    :string
#  color                   :string
#  processing_time_in_days :integer
#  description             :text
#  status                  :string
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class PriorityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
