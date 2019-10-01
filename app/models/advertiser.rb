class Advertiser < ApplicationRecord
    
    validate :uniqueness_of_a_property_across_models, on: :create
    
    has_secure_password

    def uniqueness_of_a_property_across_models
        if Advertiser.find_by(email: :email) or Podcaster.find_by(email: :email)
            errors[:email] = "このemailは使用されています"
        end
    end
    
    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # , format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }
    
    validates :name, presence: true
    validates :email, presence: true
    validates :company_name, presence: true

end