class Enquiry < ApplicationRecord
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true ,length: {maximum: 105},format: {with: VALID_EMAIL_REGEX }
end
