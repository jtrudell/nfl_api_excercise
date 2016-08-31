class Team < ApplicationRecord
  has_many :players
  validates :name, :initials, presence: true
end
