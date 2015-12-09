class HolidaysController < ApplicationController

  def index
    @holidays = Holiday.all
  end

  def show
    @holiday = params[:holiday]
    @country = params[:country]
    @year = params[:year]

    @country_occurences = get_year_holidays(@year)
    @country_occurences.select! { |i| i["name"].eql? @holiday }

    @year_occurrences = get_country_holidays(@country, @year.to_i)
    @year_occurrences.select! { |d, n| n.eql? @holiday }
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      flash[:success] = "Successfully added new holiday"
      redirect_to date_url(@holiday.date)
    else
      render 'new'
    end
  end

  def edit
    @holiday = Holiday.find_by(id: params[:id])
  end

  def update
    @holiday = Holiday.find_by(id: params[:id])
    if @holiday.update_attributes(holiday_params)
      flash[:success] = "Successfully edited holiday"
      redirect_to date_url(@holiday.date)
    else
      render 'edit'
    end
  end

  def destroy
    date = Holiday.find(params[:id]).date
    Holiday.find(params[:id]).destroy
    flash[:success] = "Holiday successfully deleted"
    redirect_to date_url(date)
  end

  private

    def holiday_params
      params.require(:holiday).permit(:name, :date)
    end

end
