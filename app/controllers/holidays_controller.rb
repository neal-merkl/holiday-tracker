class HolidaysController < ApplicationController

  def show
    country = params[:country]
    year = params[:year] #temporary

    @year_occurrences = []
    (past..future).each do |y|
      HTTParty.get("#{url}country=#{country}&year=#{y}")["holidays"].each do |h|
        @year_occurrences << h["name"]
      end
    end

    @country_occurences = []
    countries.each do |c|
      HTTParty.get("#{url}country=#{c}&year=#{year}")["holidays"].each do |h|
        @country_occurences << h["name"]
      end
    end

  end

end
