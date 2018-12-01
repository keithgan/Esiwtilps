class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_secure_password
    has_many :groups, dependent: :destroy

    validates :email, format: { with: VALID_EMAIL_REGEX}
end
