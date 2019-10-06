class Contact < ApplicationRecord
    
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL, message: "を正式なメールアドレスの形にしてください" }
    validates :content, presence: true
    
end
