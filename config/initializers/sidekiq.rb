Sidekiq.configure_client do |config|
  require 'periodic_jobs'
  Rails.application.config.after_initialize do
    AnaylyzeWeatherWorker.perform_async
  end
  config.periodic(&PERIODIC_JOBS)
end
