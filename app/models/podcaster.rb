class Podcaster < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :podcast_name, presence: true
end
