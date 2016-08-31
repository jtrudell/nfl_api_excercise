class AddArrestStatsIdToPlayerCrime < ActiveRecord::Migration[5.0]
  def change
     add_column :player_crimes, :arrest_id, :string
  end

end
