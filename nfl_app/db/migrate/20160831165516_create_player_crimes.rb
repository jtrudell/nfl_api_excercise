class CreatePlayerCrimes < ActiveRecord::Migration[5.0]
  def change
    create_table :player_crimes do |t|
      t.integer :player_id
      t.integer :crime_id
      t.text :description

      t.timestamps
    end
  end
end
