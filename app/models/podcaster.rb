class Podcaster < ApplicationRecord
    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }
    
    validates :name, presence: true
    validates :email, presence: true
    validates :podcast_name, presence: true
    
end
