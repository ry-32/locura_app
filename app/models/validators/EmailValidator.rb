class EmailValidator < ActiveModel::Validator
    
  def validate(email)
    if Advertiser.where(email: email)
        errors.add(:email, "このemailは使用されています")
    elsif Podcaster.where(email: email)
        errors.add(:email, "このemailは使用されています")
    end

  end
  
end

class Advertiser
  include ActiveModel::Validations
  validates_with EmailValidator
end
class Podcaster
  include ActiveModel::Validations
  validates_with EmailValidator
end