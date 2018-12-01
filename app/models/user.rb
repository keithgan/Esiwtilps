class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_secure_password
    has_many :groups, dependent: :destroy

    validates :email, uniqueness: true, 
                      length: { minimum: 2},
                      format: { with: VALID_EMAIL_REGEX}
end
