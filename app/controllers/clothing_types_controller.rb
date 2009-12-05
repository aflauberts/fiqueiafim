class ClothingTypesController < ApplicationController
  def index
    @clothing_types = ClothingType.all
  end
  
  def show
    @clothing_type = ClothingType.find(params[:id])
  end
  
  def new
    @clothing_type = ClothingType.new
  end
  
  def create
    @clothing_type = ClothingType.new(params[:clothing_type])
    if @clothing_type.save
      flash[:notice] = "Successfully created clothing type."
      redirect_to @clothing_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @clothing_type = ClothingType.find(params[:id])
  end
  
  def update
    @clothing_type = ClothingType.find(params[:id])
    if @clothing_type.update_attributes(params[:clothing_type])
      flash[:notice] = "Successfully updated clothing type."
      redirect_to @clothing_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @clothing_type = ClothingType.find(params[:id])
    @clothing_type.destroy
    flash[:notice] = "Successfully destroyed clothing type."
    redirect_to clothing_types_url
  end
end
