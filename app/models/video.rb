class Video < ApplicationRecord
  belongs_to :routine
  
    validates :url, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
end
