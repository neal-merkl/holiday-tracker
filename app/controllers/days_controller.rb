class DaysController < ApplicationController

  def index
  end

  def show
    @day = Day.find_by(date: params[:date])
    @holidays = @day.holidays
  end

end
