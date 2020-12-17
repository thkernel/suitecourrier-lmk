# == Schema Information
#
# Table name: drive_blobs
#
#  id           :bigint           not null, primary key
#  key          :string           not null
#  filename     :string           not null
#  content_type :string
#  metadata     :text
#  byte_size    :bigint           not null
#  checksum     :string           not null
#  created_at   :datetime         not null
#

class DriveBlob < ApplicationRecord
    has_one :drive_attachment, dependent: :destroy
end
