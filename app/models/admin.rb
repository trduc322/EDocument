class Admin < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :adname, presence: true, length: { maximum: 50 }
validates :admail, presence: true, length: { maximum: 255 },
format: { with: VALID_EMAIL_REGEX },
uniqueness: true
has_secure_password
end
