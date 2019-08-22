class CourtsController < ApplicationController
  include CourtsHelper
  def index
    location = "#{current_user.latitude}, #{current_user.longitude}"
    @results = google_api(location)

    @location_arr = [current_user.latitude, current_user.longitude]

    @courts = []
    @results.first(6).each do |result|
      court = {
        name: result["name"],
        lat: result["geometry"]["location"]["lat"],
        long: result["geometry"]["location"]["lng"],
        rating: result["rating"]
      }
      @courts << court
    end
    @courts

    create_court(@courts)

    @locations = []
    @courts.each do |court|
      @locations << [court[:lat], court[:long]]
    end
    @locations
  end

  def show
    @court = Court.find(params[:id])
  end
  
  private 

  def court_params
    params.require(:court).permit(:name, :latitude, :longitude, :details, :rating)
  end
end
