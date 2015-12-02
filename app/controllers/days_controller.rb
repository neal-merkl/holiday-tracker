class DaysController < ApplicationController
  @@countries = ["BE", "BR", "CA", "CZ", "DE", "FR", "GB", "NO", "PL", "SK", "SL", "US"]
  @@url = "http://holidayapi.com/v1/holidays?"

  def index
  end

  def show
    @day = params[:date]
    date = @day.split('-')
    day = date[0]
    month = date[1]
    year = date[2]
    @strings = []
    @holidays = []
    @@countries.each do |c|
      string = "#{@@url}country=#{c}&year=#{year}&month=#{month}&day=#{day}"
      @strings << string
      holiday = HTTParty.get("#{@@url}country=#{c}&year=#{year}&month=#{month}&day=#{day}")["holidays"][0]
      @holidays << holiday
    end

  end

end
