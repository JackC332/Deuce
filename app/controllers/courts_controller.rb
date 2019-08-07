class CourtsController < ApplicationController
  include CourtsHelper
  def index
    @results = google_api()

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
