class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :first_name, presence: true
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true ,length: {maximum: 105},uniqueness: { case_sensitive: false },format: {with: VALID_EMAIL_REGEX }
    validates :password, length: { in: 6..12 }, allow_blank: true

    has_secure_password
end
