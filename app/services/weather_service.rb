class WeatherService
  def self.get_10_day_forecast(destination_name)
    response = Faraday.get("http://api.wunderground.com/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/forecast10day/q/#{destination.zip}.json")
    JSON.parse(response.body, symbolize_names: true)
  end
end
