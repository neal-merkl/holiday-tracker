class HolidaysController < ApplicationController

  def show
    @holiday = params[:holiday]
    @country = params[:country]
    @year = params[:year]

    @country_occurences = get_year_holidays(@year)
    @country_occurences.select! { |i| i["name"].eql? @holiday }

    @year_occurrences = get_country_holidays(@country, @year.to_i)
    @year_occurrences.select! { |d, n| n.eql? @holiday }
  end

end
