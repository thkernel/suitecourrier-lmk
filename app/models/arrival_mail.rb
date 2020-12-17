# == Schema Information
#
# Table name: arrival_mails
#
#  id                    :bigint           not null, primary key
#  uid                   :string
#  register_id           :bigint
#  internal_reference    :string
#  external_reference    :string
#  departure_date        :datetime
#  receipt_date          :datetime
#  linked_to_mail        :string
#  reference_linked_mail :string
#  to_answer             :string
#  response_limit_time   :datetime
#  response_date         :datetime
#  support_id            :bigint
#  nature_id             :bigint
#  correspondent_id      :bigint
#  object                :string
#  description           :text
#  reserved_suite        :string
#  folder_id             :bigint
#  status                :string
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class ArrivalMail < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :user



  belongs_to :register
  belongs_to :support
  belongs_to :nature
  belongs_to :correspondent
  belongs_to :folder, optional: true

  has_many :imputations, as: :imputable,  dependent: :destroy
  has_many :drive_attachments, as: :attachable,  dependent: :destroy

  validates :internal_reference, presence: true, uniqueness: true


  #has_many_attached :files

  
end
