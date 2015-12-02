class DaysController < ApplicationController
  def index
  end

  def show
    countries = ["BE", "BR", "CA", "CZ", "DE", "FR", "GB", "NO", "PL", "SK", "SL", "US"]
    url = "http://holidayapi.com/v1/holidays?"

    @day = params[:date]

    date = @day.split('-')
    day = date[0]
    month = date[1]
    year = date[2]

    @holidays = []
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{year}&month=#{month}&day=#{day}")["holidays"].each do |h|
        @holidays << h["name"]
      end
    end
  end

end
