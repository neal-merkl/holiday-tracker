class DaysController < ApplicationController

  def index
  end

  def show
    @day = Day.find_by(id: params[:id])
    @holidays = @day.holidays
  end
  
end
