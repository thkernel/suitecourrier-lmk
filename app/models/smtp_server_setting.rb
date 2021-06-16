# == Schema Information
#
# Table name: smtp_server_settings
#
#  id                    :bigint           not null, primary key
#  uid                   :string
#  delivery_method       :string
#  authentication_method :string
#  host                  :string
#  port                  :integer
#  authentication        :string
#  user_name             :string
#  password              :string
#  sending_address       :string
#  domain                :string
#  enable_starttls_auto  :boolean
#  ssl                   :boolean
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class SmtpServerSetting < ApplicationRecord
  belongs_to :user
end
