# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  uid         :string
#  title       :string
#  description :text
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :user
  has_many :imputation_items, dependent: :destroy
  
end
