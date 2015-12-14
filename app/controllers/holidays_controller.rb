class HolidaysController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password",
                               except: [:show]

  def index
    @holidays = Holiday.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def show
    @holiday = params[:holiday]
    @country = params[:country]
    @year = params[:year]

    api = get_year_holidays(@country, @year.to_i).select! { |d, n| n.eql? @holiday }
    Holiday.where("name = ? AND country = ?", @holiday, @country).each do |o|
      api[o.date.split("-").reverse.join("-")] = o.name
    end
    @year_occurrences = api.sort_by { |i| i }

    api = get_country_holidays(@year).select! { |i| i["name"].eql? @holiday }
    Holiday.where("name = ?", @holiday).each do |o|   #need to query for year
      api << { "name" => o.name,
               "country" => o.country,
               "date" => o.date.split("-").reverse.join("-") }
    end
    @country_occurences = api.sort_by { |i| i[0] }
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      flash[:success] = "Successfully added new holiday"
      redirect_to '/holidays'
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
      redirect_to '/holidays'
    else
      render 'edit'
    end
  end

  def destroy
    date = Holiday.find(params[:id]).date
    Holiday.find(params[:id]).destroy
    flash[:success] = "Holiday successfully deleted"
    redirect_to '/holidays'
  end

  private

    def holiday_params
      params.require(:holiday).permit(:name, :date)
    end

end
