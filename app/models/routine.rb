class Routine < ApplicationRecord
    has_many :videos
    has_many :pickups
    belongs_to :user
end
