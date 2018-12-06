class Group < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :bills, dependent: :destroy

    validates :name, presence: true
    validate :name_length

    include PgSearch
    pg_search_scope :omnisearch, :against => :name

    def name_length
        if self.name.length < 5
            errors.add(:name, "Minimum 5 characters for the name of a group")
        end
    end
end
