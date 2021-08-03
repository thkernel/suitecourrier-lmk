# == Schema Information
#
# Table name: arrival_mails
#
#  id                      :bigint           not null, primary key
#  uid                     :string
#  register_id             :bigint
#  internal_reference      :string
#  external_reference      :string
#  departure_date          :date
#  receipt_date            :date
#  linked_to_mail          :string
#  reference_linked_mail   :string
#  to_answer               :string
#  response_limit_time     :date
#  response_date           :date
#  support_id              :bigint
#  nature_id               :bigint
#  correspondent_id        :bigint
#  object                  :string
#  description             :text
#  folder_id               :bigint
#  processing_entity_id    :bigint
#  processing_recipient_id :bigint
#  processing_deadline     :date
#  processing_date         :date
#  processed               :boolean
#  mail_priority_id        :bigint
#  mail_status_id          :bigint
#  mail_type_id            :bigint
#  mail_category_id        :bigint
#  year                    :integer
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class ArrivalMail < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :user



  belongs_to :register
  belongs_to :support
  belongs_to :nature
  belongs_to :mail_type
  belongs_to :mail_category
  belongs_to :mail_status
  belongs_to :mail_priority
  belongs_to :correspondent
  belongs_to :folder, optional: true

  has_many :imputations, as: :imputable,  dependent: :destroy

  belongs_to :processing_entity, :foreign_key => "processing_entity_id", :class_name => "Entity"
  belongs_to :processing_recipient, :foreign_key => "processing_recipient_id", :class_name => "User"
  #has_many :drive_attachments, as: :attachable,  dependent: :destroy

  validates :internal_reference, presence: true, uniqueness: true


  has_many_attached :files


  # Change default params ID to uid
  def to_param
    uid
  end
  
end
