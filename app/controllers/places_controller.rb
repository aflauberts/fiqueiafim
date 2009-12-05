class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
  
  def show
    @place = Place.find(params[:id])
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(params[:place])
    if @place.save
      flash[:notice] = "Successfully created place."
      redirect_to places_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @place = Place.find(params[:id])
  end
  
  def update
    params[:place][:category_ids] ||= []
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      flash[:notice] = "Successfully updated place."
      redirect_to places_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:notice] = "Successfully destroyed place."
    redirect_to places_url
  end
end
