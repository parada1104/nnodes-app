Sidekiq.configure_client do |config|
    Rails.application.config.after_initialize do
      AnaylyzeWeatherWorker.perform_async
    end
end
