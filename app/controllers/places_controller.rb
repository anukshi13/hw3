class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  # Show one place and its entries (show action)
  def show
    @place = Place.find(params[:id])
  end

  # Show the form to add a new place (new action)
  def new
    @place = Place.new
  end

  # Create a new place and save it (create action)
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path  # Go back to the list
    else
      render :new  # Show the form again if there’s an error
    end
  end

  private

  # Allow only the name field for security
  def place_params
    params.require(:place).permit(:name)
  end
end
