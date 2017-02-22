class WeatherService
  def self.get_10_day_forecast(destination_zip)
    response = Faraday.get("http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/forecast10day/q/#{destination_zip}.json")
    JSON.parse(response.body, symbolize_names: true)[:forecast][:simpleforecast][:forecastday]
  end
end
