class CourtsController < ApplicationController
  include CourtsHelper
  def index
    location = "#{current_user.latitude}, #{current_user.longitude}"
    @results = google_api(location)

    @location_arr = [current_user.latitude, current_user.longitude]

    @courts = []
    @results.first(5).each do |result|
      court = {
        name: result["name"],
        lat: result["geometry"]["location"]["lat"],
        long: result["geometry"]["location"]["lng"],
        rating: result["rating"]
      }
      @courts << court
    end
    @courts

    @locations = []
    @courts.each do |court|
      @locations << [court[:lat], court[:long]]
    end
    @locations
  end

  def show
    @court = Court.find(params[:id])
  end

  def create
  end  
end
