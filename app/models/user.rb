class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    has_many :pickups
    has_many :routines, dependent: :destroy
    has_many :routine_videos, through: :routines, source: :videos, dependent: :destroy
    has_many :obtainings, through: :pickups, source: :routine
    has_many :reverses_of_obtain, class_name: 'Pickup', foreign_key: 'routine_id'
    has_many :takeins, dependent: :destroy
    has_many :possesses, through: :takeins, source: :video, dependent: :destroy


    
    before_save { self.mail.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :mail, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :gender, presence: true
    has_secure_password
    
  def obtain(other_routine)
    unless self.routines == other_routine
      self.pickups.find_or_create_by(routine_id: other_routine.id)
    end
  end
  
  def release(other_routine)
    pickup = self.pickups.find_by(routine_id: other_routine.id)
    pickup.destroy if pickup
  end
  
  def obtaining?(other_routine)
    self.obtainings.include?(other_routine)
  end
  
  def possess(other_video)
        self.takeins.find_or_create_by(video_id: other_video.id)
  end
    
  def letgo(other_video)
        takein = self.takeins.find_by(video_id: other_video.id)
        takein.destroy if takein
  end
    
  def possessing?(other_video)
        self.possesses.include?(other_video)
  end
  
end
