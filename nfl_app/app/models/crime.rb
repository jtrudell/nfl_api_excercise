class Crime < ApplicationRecord
  has_many :player_crimes
  has_many :players, through: :player_crimes
  validates :category, presence: true

  before_validation :set_value

  def set_value
    self.category = 'Not Specified' if self.category.nil?
  end
end
