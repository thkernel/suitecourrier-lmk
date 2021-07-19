# == Schema Information
#
# Table name: mail_priorities
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  color                   :string
#  processing_time_in_days :integer
#  description             :text
#  status                  :string
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class MailPriority < ApplicationRecord
  belongs_to :user
end
