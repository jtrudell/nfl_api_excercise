class Player < ApplicationRecord
  lookup_for :team
  lookup_for :position
  belongs_to :team
  belongs_to :position
  has_many :player_crimes
  has_many :crimes, through: :player_crimes

  validates :name, :team_id, :position_id, presence: true

  def update_arrests
    player = self
    name_param = URI.escape("#{player.name}")
    uri = URI("http://nflarrest.com/api/v1/player/arrests/#{name_param}")
    begin
      res = Net::HTTP.get_response(uri)
      arrests = JSON.parse(res.body) if Net::HTTPOK
    rescue StandardError => e
      job.errors.push(e)
    end
    PlayerCrime.process_arrests(arrests, player)
  end
end
