class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end
  
  def show
    @district = District.find(params[:id])
  end
  
  def new
    @district = District.new
  end
  
  def create
    @district = District.new(params[:district])
    if @district.save
      flash[:notice] = "Successfully created district."
      redirect_to @district
    else
      render :action => 'new'
    end
  end
  
  def edit
    @district = District.find(params[:id])
  end
  
  def update
    @district = District.find(params[:id])
    if @district.update_attributes(params[:district])
      flash[:notice] = "Successfully updated district."
      redirect_to @district
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @district = District.find(params[:id])
    @district.destroy
    flash[:notice] = "Successfully destroyed district."
    redirect_to districts_url
  end
end
