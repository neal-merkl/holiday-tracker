class DaysController < ApplicationController
  def show
    @day = Day.find_by(id: params[:id])
    @holidays = @day.holidays
  end
end
