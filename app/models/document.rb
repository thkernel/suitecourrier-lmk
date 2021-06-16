# == Schema Information
#
# Table name: documents
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  slug                 :string
#  support_id           :bigint
#  mail_type_id         :bigint
#  departure_date       :datetime
#  receipt_date         :datetime
#  correspondent_id     :bigint
#  initiating_entity_id :bigint
#  processing_entity_id :bigint
#  processing_deadline  :datetime
#  folder_id            :bigint
#  object               :string
#  description          :text
#  status               :string
#  year                 :integer
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Document < ApplicationRecord
  include SharedUtils::Generate
  before_save :generate_random_number_uid

  belongs_to :support
  belongs_to :nature
  belongs_to :folder
  belongs_to :user

  has_many :imputations, as: :imputable,  dependent: :destroy
  #has_many :drive_attachments, as: :attachable,  dependent: :destroy

  acts_as_taggable_on :tags

  has_many_attached :files

  # Validations.
  validates :name, presence: true
  
end
