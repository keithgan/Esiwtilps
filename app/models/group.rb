class Group < ApplicationRecord
    belongs_to :users
    has_many :users, dependent: :destroy
end
