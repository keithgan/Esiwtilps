class Bill < ApplicationRecord
  belongs_to :group
  has_many :user
end
