class CheckArrestsWorker
  include Sidekiq::Worker

  def perform
    start = Time.now
    update_player_arrests
    duration = Time.now - start
    job = Sidekiq::Cron::Job.find('schedule_check_arrests_worker')
    status = job.errors.any? ? "errored: #{job.errors}" : "complete"
    ArrestCronJob.create(duration: duration, status: status)
  end

  private
  def update_player_arrests
    Player.all.each { |player| player.update_arrests }
  end
end

