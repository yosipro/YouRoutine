class Routine < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    has_many :videos, dependent: :destroy
    has_many :pickups, dependent: :destroy
    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 50 }
    validates :time, presence: true, numericality: {only_integer: true}
    validates :image, presence: true
    validates :status, presence: true
    
end
