class Group < ApplicationRecord
    has_many :memberships
    has_many :user, dependent: :destroy
    include PgSearch
    pg_search_scope :omnisearch, :against => :name
end
