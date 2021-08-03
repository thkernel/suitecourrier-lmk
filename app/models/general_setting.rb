# == Schema Information
#
# Table name: general_settings
#
#  id                              :bigint           not null, primary key
#  uid                             :string
#  application_name                :string
#  login_screen_message            :string
#  home_screen_message             :string
#  logo                            :string
#  wallpaper                       :string
#  folder_prefix                   :string
#  folder_suffix                   :string
#  arrival_mail_reference_format   :string
#  departure_mail_reference_format :string
#  document_reference_format       :string
#  internal_memo_reference_format  :string
#  user_id                         :bigint
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class GeneralSetting < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user

  # Change default params ID to uid
  def to_param
    uid
  end

  
end
