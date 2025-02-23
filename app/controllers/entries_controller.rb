class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build
  end

  # Create a new entry and save it (create action)
  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)
    if @entry.save
      redirect_to place_path(@place)  # Go back to the place’s page
    else
      render :new  # Show the form again if there’s an error
    end
  end

  private

  # Allow title, description, and date fields for security
  def entry_params
    params.require(:entry).permit(:title, :description, :date)
  end
end
