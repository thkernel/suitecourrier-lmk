# == Schema Information
#
# Table name: public.smtp_server_settings
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  host                 :string
#  user_name            :string
#  user_password        :string
#  domain               :string
#  address              :string
#  port                 :integer
#  authentification     :string
#  enable_starttls_auto :boolean
#  ssl                  :boolean
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class SmtpServerSetting < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user

  # Change default params ID to uid
  def to_param
    uid
  end

  
end
