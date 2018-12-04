class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_secure_password
    has_many :authentications, dependent: :destroy
    has_many :memberships
    has_many :groups, dependent: :destroy
    has_many :friends, dependent: :destroy
    
    validates :email, uniqueness: true, 
                      length: { minimum: 2},
                      format: { with: VALID_EMAIL_REGEX}

    include PgSearch
    pg_search_scope :omniscope, :against => :name

    def self.create_with_auth_and_hash(authentication, auth_hash)
        user = self.create!(
            name: auth_hash["info"]["name"],
            email: auth_hash["info"]["email"],
            phone_number: auth_hash["info"]["phone_number"],
            email: auth_hash["info"]["email"],
            password: SecureRandom.hex(10)
        )
        user.authentications << authentication
        return user
    end
    
    # grab google to access google for user data
    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end
end
