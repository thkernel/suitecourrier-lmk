# == Schema Information
#
# Table name: indices
#
#  id             :bigint           not null, primary key
#  name           :string
#  description    :text
#  status         :string
#  indexable_type :string
#  indexable_id   :bigint
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class IndexTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
