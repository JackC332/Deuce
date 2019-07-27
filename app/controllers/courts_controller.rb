class CourtsController < ApplicationController
  def index
  end

  def show
    @court = Court.find(params[:id])
  end

  def create
  end  
end
