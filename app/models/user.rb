class User < ApplicationRecord
    has_many :pickups
    has_many :routines
    
    before_save { self.mail.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :mail, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :gender, presence: true
    has_secure_password
end
