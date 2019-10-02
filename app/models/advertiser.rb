class Advertiser < ApplicationRecord
    
    validates :name, presence: true
    validates :email, presence: true
    validates :company_name, presence: true

    has_secure_password
    
    # validate :uniqueness_of_a_property_across_models #, on: :create
    
    # def self.uniqueness_of_a_property_across_models(advertiser,email)
    #     if Advertiser.where(email: email)
    #         advertiser.errors.add(:email, "このemailは使用されています")
    #     elsif Podcaster.where(email: email)
    #         self.errors.add(:email, "このemailは使用されています")
    #     end
    # end
    
    
    # def uniqueness_of_a_property_across_models
        
    #     # binding.pry
        
    #     if Advertiser.where(email: :email)
    #         errors.add(:email, "このemailは使用されています")
    #     elsif Podcaster.where(email: :email)
    #         errors.add(:email, "このemailは使用されています")
    #     end
    # end

    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }

end