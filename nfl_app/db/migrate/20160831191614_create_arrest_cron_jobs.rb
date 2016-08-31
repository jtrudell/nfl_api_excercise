class CreateArrestCronJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :arrest_cron_jobs do |t|
      t.integer :duration
      t.string :status

      t.timestamps
    end
  end
end
