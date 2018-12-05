class Group < ApplicationRecord
    has_many :memberships
    has_many :users, dependent: :destroy
    has_many :bills, dependent: :destroy

    include PgSearch
    pg_search_scope :omnisearch, :against => :name
end
