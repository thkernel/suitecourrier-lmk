# == Schema Information
#
# Table name: registers
#
#  id            :bigint           not null, primary key
#  uid           :string
#  register_type :string
#  name          :string
#  start_date    :datetime
#  end_date      :datetime
#  reference     :string
#  description   :text
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Register < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  
  belongs_to :user


  # Validations
  validates :name, presence: true, uniqueness: true
  
end
