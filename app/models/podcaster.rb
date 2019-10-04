class Podcaster < ApplicationRecord
    
    has_secure_password
    
    def self.uniqueness_of_a_property_across_models(email)
        
        if Advertiser.where(email: email).length >= 1
            return true
        elsif Podcaster.where(email: email).length >= 1
            return true
        end
        
        return false
    end
    
    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }
    
    validates :name, presence: true
    validates :email, presence: true
    validates :podcast_name, presence: true
    validates :password, presence: true
    
    
end
