class Group < ApplicationRecord
    has_and_belongs_to_many :user, dependent: :destroy
    include PgSearch
    pg_search_scope :omnisearch, :against => :name
end
