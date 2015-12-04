class DaysController < ApplicationController
  def index
  end

  def show
    @day = params[:date]

    date = @day.split('-')
    day = date[0]
    month = date[1]
    @year = date[2]

    @holidays = []
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{@year}&month=#{month}&day=#{day}")["holidays"].each do |h|
        @holidays << h["name"]
      end
    end
  end

end
