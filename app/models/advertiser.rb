class Advertiser < ApplicationRecord
    
    validate :uniqueness_of_a_property_across_models

    def uniqueness_of_a_property_across_models
        if Advertiser.where(email: :email) or Podcaster.where(email: :email)
            errors.add(:email, "このemailは使用されています")
        end
    end
    
    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }
    
    validates :name, presence: true
    validates :email, presence: true
    validates :company_name, presence: true
    
end