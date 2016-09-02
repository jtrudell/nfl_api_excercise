class Team < ApplicationRecord
  lookup_by :name, cache: true
  has_many :players
  validates :name, :initials, presence: true
end
