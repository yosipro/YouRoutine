class Routine < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    has_many :videos
    has_many :pickups
    belongs_to :user
end
