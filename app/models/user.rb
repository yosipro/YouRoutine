class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    has_many :pickups
    has_many :routines
    has_many :routine_videos, through: :routines, source: :videos
    
    before_save { self.mail.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :mail, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :gender, presence: true
    has_secure_password
end
