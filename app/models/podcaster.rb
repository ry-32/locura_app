class Podcaster < ApplicationRecord
    
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL, message: "を正式なメールアドレスの形にしてください" }
    validates :podcast_name, presence: true
    validates :password, presence: true
    
    
    has_secure_password
    
    
    def self.uniqueness_of_a_property_across_models(email)
        if Advertiser.where(email: email).length >= 1
            return true
        elsif Podcaster.where(email: email).length >= 1
            return true
        end
        
        return false
    end
    
end
