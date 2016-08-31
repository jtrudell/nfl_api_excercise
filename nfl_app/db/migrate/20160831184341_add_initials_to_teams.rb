class AddInitialsToTeams < ActiveRecord::Migration[5.0]
  def change
     add_column :teams, :initials, :string
  end
end
