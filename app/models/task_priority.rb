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

class TaskPriority < ApplicationRecord
  belongs_to :user
end
