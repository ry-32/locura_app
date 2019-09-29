class Advertiser < ApplicationRecord
    
    validates :name, presence: true
    validates :company_name, presence: true
    validates :email, presence: true

end