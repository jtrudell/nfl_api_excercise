class ChangeDataTypeForArrestcronjobDuration < ActiveRecord::Migration[5.0]
  def change
     change_column :arrest_cron_jobs, :duration, :decimal, precision: 5
  end
end
