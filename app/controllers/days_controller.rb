class DaysController < ApplicationController
  def index
  end

  def show
    @day = params[:date]

    date = @day.split('-')
    day = date[0]
    month = date[1]
    @year = date[2]

    @holidays = get_day_holidays(@year, month, day)
  end

end
