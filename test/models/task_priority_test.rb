# == Schema Information
#
# Table name: task_priorities
#
#  id                      :bigint           not null, primary key
#  uid                     :string
#  name                    :string
#  color                   :string
#  processing_time_in_days :integer
#  description             :text
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class TaskPriorityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
