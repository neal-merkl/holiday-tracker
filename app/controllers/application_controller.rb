class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :url, :countries

  def url
    "http://holidayapi.com/v1/holidays?"
  end

  def countries
    ["BE", "BR", "CA", "CZ", "DE", "FR", "GB", "NO", "PL", "SK", "SL", "US"]
  end

  def get_day_holidays(y, m, d)
    holidays = {}
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{y}&month=#{m}&day=#{d}")["holidays"].each do |h|
        holidays[h["name"]] = [h["country"], h["date"]]
      end
    end
    holidays
  end

  # s is start year
  def get_year_holidays(c, s)
    json = []
    holidays = {}
    (s-5..s+5).each do |y|
      HTTParty.get("#{url}country=#{c}&year=#{y}")["holidays"].each do |h|
        json << h[1]
      end
    end
    json.each do |i|
      i.each do |h|
        holidays[h["date"]] = h["name"]
      end
    end
    holidays
  end

  def get_country_holidays(y)
    holidays = []
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{y}")["holidays"].each do |i|
        i[1].each do |h|
          holidays << h
        end
      end
    end
    holidays
  end

end
