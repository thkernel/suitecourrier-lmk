# == Schema Information
#
# Table name: drive_attachments
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  attachable_type :string           not null
#  attachable_id   :bigint           not null
#  drive_blob_id   :bigint           not null
#  created_at      :datetime         not null
#

class DriveAttachment < ApplicationRecord
    belongs_to :attachable, polymorphic: true
    belongs_to :drive_blob
end
