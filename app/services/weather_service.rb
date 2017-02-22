class WeatherService
  def self.get_10_day_forecast(destination_id)
    response = Faraday.get()
    JSON.parse(response.body, symbolize_names: true)
  end
end
