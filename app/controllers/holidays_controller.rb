class HolidaysController < ApplicationController

  def show
    #temporary assignment of variables
    holiday = params[:holiday]
    country = params[:country]
    year = params[:year]

    @country_occurences = get_year_holidays(year)
    @country_occurences.select! { |h| h.eql? holiday }

    @year_occurrences = get_country_holidays(country, year)
    @year_occurrences.select! { |h| h.eql? holiday }
  end

end
