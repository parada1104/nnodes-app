class AnaylyzeWeatherWorker
  include Sidekiq::Worker
  WEATHER_URI = "https://api.openweathermap.org/data/2.5/onecall?lat=#{ENV["WEATHER_LAT"]}&lon=#{ENV["WEATHER_LNG"]}&exclude=current,minutely,hourly,alerts&units=metrics&appid=#{ENV["WEATHER_API_KEY"]}"
  CONSERVATIVE_TEMP = 23

  def perform()
    begin
      response = HTTParty.get(WEATHER_URI).to_h
      next_seven_days_temps = response["daily"].map { |day| day["temp"]["max"] }
      be_conservative = false
      next_seven_days_temps.each do |temp|
        if temp > CONSERVATIVE_TEMP
          be_conservative = true
          break
        end
      end
      be_conservative ? Redis.set("be_conservative", "1") : Redis.set("be_conservative", "0")
    rescue
      Redis.set("be_conservative", "0")
    end

  end
end
