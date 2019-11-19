class Podcaster < ApplicationRecord
    
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    attr_accessor :podcast_name
    attr_accessor :dl
    attr_accessor :password_confirmation
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL, message: "を正式なメールアドレスの形にしてください" }
    validates :password, presence: true, on: :create, length: { in: 8..12 }
    validates :password, presence: true, on: :update, length: { in: 8..12 }
    validates :password, presence: true, on: :login

    
    
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
