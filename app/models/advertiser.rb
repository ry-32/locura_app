class Advertiser < ApplicationRecord
    
    validates :name, presence: true
    validates :email, presence: true
    validates :company_name, presence: true

    has_secure_password
    
    def self.uniqueness_of_a_property_across_models(advertiser,email)
        
        if Advertiser.where(email: email).length >= 1
            return true
        elsif Podcaster.where(email: email).length >= 1
            return true
        end
        
        return false
    end

    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }

end