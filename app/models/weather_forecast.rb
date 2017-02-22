class WeatherForecast
  attr_reader :weekday,
              :month,
              :day,
              :high_temp,
              :low_temp,
              :weather_conditions

  def initialize(attrs)
    @weekday            = attrs[:date][:weekday]
    @month              = Date::MONTHNAMES[attrs[:date][:month]]
    @day                = attrs[:date][:day]
    @high_temp          = attrs[:high][:fahrenheit]
    @low_temp           = attrs[:low][:fahrenheit]
    @weather_conditions = attrs[:conditions]
  end

  def self.get_10_day_forecast(destination_id)
    WeatherService.get_10_day_forecast(destination_id).map do |day|
      new(day)
    end
  end
end
