# == Schema Information
#
# Table name: request_imputation_tasks
#
#  id                    :bigint           not null, primary key
#  uid                   :string
#  task_type_id          :bigint
#  title                 :string
#  description           :text
#  start_date            :datetime
#  end_date              :datetime
#  closing_date          :datetime
#  task_status_id        :bigint
#  request_imputation_id :bigint
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class RequestImputationTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
