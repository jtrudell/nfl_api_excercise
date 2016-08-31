class PlayerCrime < ApplicationRecord
  belongs_to :player
  belongs_to :crime

  validates :player_id, :crime_id, :description, presence: true

  def self.process_arrests(arrests, player)
    arrests.each do |arrest|
      api_arrest_id = arrest['arrest_stats_id']
      existing_record = PlayerCrime.find_by(arrest_id: api_arrest_id)
      if !existing_record.present?
        crime = Crime.find_or_create_by(category: arrest['Category'])
        PlayerCrime.create(crime_id: crime.id, player_id: player.id, description: arrest['Description'], arrest_id: api_arrest_id)
      end
    end
  end
end
