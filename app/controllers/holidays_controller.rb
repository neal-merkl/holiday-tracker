class HolidaysController < ApplicationController

  def show
    holiday = params[:holiday]
    country = params[:country]
    year = params[:year]

    @country_occurences = []
    query1 = get_year_holidays(year)
    query1.each do |i|
      i.each do |h|
        @country_occurences << h #[h["date"]] = { h["country"] => h["name"] }
      end
    end
    #@country_occurences.select! { |d, n| n.eql? holiday }

    @year_occurrences = {}
    query2 = get_country_holidays(country, year.to_i)
    query2.each do |i|
      i.each do |h|
        @year_occurrences[h["date"]] = h["name"]
      end
    end
    @year_occurrences.select! { |d, n| n.eql? holiday }
  end

end
