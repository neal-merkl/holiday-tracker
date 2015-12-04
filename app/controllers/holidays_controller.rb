class HolidaysController < ApplicationController

  def show
    holiday = params[:holiday]
    country = params[:country]
    year = params[:year]

    # have Hash of holidays in given countries and years
    # need to filter correct info

    @country_occurences = get_year_holidays(year)
    #@country_occurences.select! { |h| h.eql? holiday }

    query2 = get_country_holidays(country, year.to_i)
    @year_occurrences = query2.select! { |h| h.include? holiday }
  end

end
