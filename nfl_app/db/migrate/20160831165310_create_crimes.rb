class CreateCrimes < ActiveRecord::Migration[5.0]
  def change
    create_table :crimes do |t|
      t.string :category

      t.timestamps
    end
  end
end
