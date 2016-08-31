# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def nfl_api_request(url)
  nfl_api = URI(url)
  begin
    res = Net::HTTP.get_response(nfl_api)
    JSON.parse(res.body) if Net::HTTPOK
  rescue StandardError => e
    puts 'Something went wrong.', e
  end
end

def seed_teams
  teams = nfl_api_request('http://nflarrest.com/api/v1/team/search/?term=')
  teams.each { |team| Team.create(name: team['teams_full_name'], initials: team['team_code']) }
end

def seed_positions
  positions = nfl_api_request('http://nflarrest.com/api/v1/position')
  positions.each { |position| Position.create(name: position['Position']) }
end

def seed_crimes
  crimes = nfl_api_request('http://nflarrest.com/api/v1/crime')
  crimes.each { |crime| Crime.create(category: crime['Category']) }
end

def seed_players
  players = nfl_api_request('http://nflarrest.com/api/v1/player')

  players.each do |player|
    position = Position.find_or_create_by(name: player['Position'])
    name_param = URI.escape("#{player["Name"]}")
    arrest_details = nfl_api_request("http://nflarrest.com/api/v1/player/arrests/#{name_param}")

    # Assumes player belongs to one team, rather than player belongs to many teams during career
    # Bad assumption if API data based on team player was on when arrested vs. team player currently plays for
    team_initials = arrest_details[0]['Team']
    team = Team.find_or_create_by(initials: team_initials)
    current_player = Player.create(name: player['Name'], position_id: position.id, team_id: team.id)

    arrest_details.each do |arrest|
      crime = Crime.find_or_create_by(category: arrest['Category'])
      PlayerCrime.create(crime_id: crime.id, player_id: current_player.id, description: arrest['Description'], arrest_id: arrest['arrest_stats_id'])
    end
  end
end

seed_teams
seed_positions
seed_crimes
seed_players

