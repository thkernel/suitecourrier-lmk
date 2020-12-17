# == Schema Information
#
# Table name: directions
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Direction < ApplicationRecord
    
    # Validations.
    validates :name, presence: true, uniqueness: true
    
end
