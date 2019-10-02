class Advertiser < ApplicationRecord
    
    validates :name, presence: true
    validates :email, presence: true
    validates :company_name, presence: true

    has_secure_password
    
    # validate :uniqueness_of_a_property_across_models #, on: :create
    
    
    # def uniqueness_of_a_property_across_models
        
    #     # binding.pry
        
    #     num = Advertiser.where(email: :email).length
    #     binding.pry
    #     if Advertiser.where(email: :email).length >= 1
    #         errors.add(:email, "このemailは使用されています")
    #     # elsif Podcaster.where(email: :email)
    #     #     errors.add(:email, "このemailは使用されています")
    #     end
    # end
    
    
    
    
    def self.uniqueness_of_a_property_across_models(advertiser,email)
        
        # binding.pry
        
        if Advertiser.where(email: email).length >= 1
            # errors.add(:email, "このemailは使用されています")
            return true
        elsif Podcaster.where(email: email).length >= 1
            return true
            # errors.add(:email, "このemailは使用されています")
        end
        
        return false
    end

    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }

end