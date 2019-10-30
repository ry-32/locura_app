class Deal < ApplicationRecord
    
    validates :name, presence: true
    validates :advertiser_id, presence: true
    validates :podcaster_id, presence: true
    validates :episode_id, presence: true
    validates :forecasted_dl, presence: true
    validates :cost, presence: true
    validates :status, presence: true
    
end
