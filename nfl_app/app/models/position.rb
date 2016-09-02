class Position < ApplicationRecord
  lookup_by :name, cache: true
  has_many :players
  validates :name, presence: true
  before_validation :set_value

  def set_value
    self.name = 'Not Specified' if self.name.nil?
  end
end
