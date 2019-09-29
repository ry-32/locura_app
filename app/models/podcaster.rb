class Podcaster < ApplicationRecord
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "正式なフォーマットにしてください" }
    validates :podcast_name, presence: true
end
