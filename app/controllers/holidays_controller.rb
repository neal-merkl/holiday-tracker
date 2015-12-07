class HolidaysController < ApplicationController

  def show
    @holiday = params[:holiday]
    @country = params[:country]
    @year = params[:year]

    @country_occurences = get_year_holidays(@year)
    @country_occurences.select! { |i| i["name"].include? @holiday }

    @year_occurrences = get_country_holidays(@country, @year.to_i)
    @year_occurrences.select! { |d, n| n.eql? @holiday }
  end

  def new
    @holiday = Holiday.new # want to send
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      redirect_to date_url(@holiday.date)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
    def holiday_params
      params.require(:holiday).permit(:name, :date)
    end

end
