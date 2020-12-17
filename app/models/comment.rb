# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  content          :text
#  status           :string
#  user_id          :bigint
#  commentable_type :string
#  commentable_id   :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
