class ArrestCronJob < ApplicationRecord
  validates :duration, :status, presence: true
end
