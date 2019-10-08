class Advertiser < ApplicationRecord
    
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL, message: "を正式なメールアドレスの形にしてください" }
    validates :company_name, presence: true
    validates :password, presence: true, on: :create
    validates :password, presence: true, on: :login

    has_secure_password
    
    def self.uniqueness_of_a_property_across_models(advertiser,email)
        
        if Advertiser.where(email: email).length >= 1
            return true
        elsif Podcaster.where(email: email).length >= 1
            return true
        end
        
        return false
    end

end