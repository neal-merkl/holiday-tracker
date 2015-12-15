class DaysController < ApplicationController
  
  def index
  end

  def show
    @day = params[:date]

    date = @day.split('-')
    day = date[0]
    month = date[1]
    @year = date[2]

    api = get_day_holidays(@year, month, day)
    Holiday.where("date = ?", "#{day}-#{month}-#{@year}").each do |o|
      api[o.name] = [o.country, o.date]
    end
    @holidays = api.sort_by { |i| i[1] }
  end

end
