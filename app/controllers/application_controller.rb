class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :url, :countries

  def url
    "http://holidayapi.com/v1/holidays?"
  end

  def countries
    ["BE", "BR", "CA", "CZ", "DE", "FR", "GB", "NO", "PL", "SK", "SL", "US"]
  end

  def get_day_holidays(y, m, d)
    holidays = []
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{y}&month=#{m}&day=#{d}")["holidays"].each do |h|
        holidays << h
      end
    end
    holidays
  end

  def get_year_holidays(y)
    holidays = []
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{y}")["holidays"].each do |h|
        holidays << h[1]
      end
    end
    holidays
  end

  # s is start year
  def get_country_holidays(c, s)
    holidays = []
    (s-5..s+5).each do |y|
      HTTParty.get("#{url}country=#{c}&year=#{y}")["holidays"].each do |h|
        holidays << h[1]
      end
    end
    holidays
  end

end
