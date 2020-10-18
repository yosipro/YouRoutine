class Video < ApplicationRecord
  
  belongs_to :routine
  has_many :takeins, dependent: :destroy
  has_many :getters, through: :takeins, source: :user, dependent: :destroy
  

    before_save { self.start_time.downcase! }
    before_save { self.end_time.downcase! }
    validates :url, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :description, presence: true, length: { maximum: 30 }
    
    def self.search(search)   
        if search  
          where(['description LIKE ?', "%#{search}%"])   
        else  
          all  
        end  
    end  

end
