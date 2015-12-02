class DaysController < ApplicationController

  def index
  end

  def show
    @day = params[:date]
    @holiday = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
  end

end
