class ProfilesController < ApplicationController

  def show
    if current_user.profile.nil?
      redirect_to :action => "new"
    else
      redirect_to :action => "edit"
    end
  end

  def edit
    @profile = current_user.profile
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.user = current_user
    @profile.visible_fields = params[:visible_fields].to_s
    if @profile.save
      flash[:notice] = "Profile Created"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def update
    @profile = current_user.profile
    @profile.visible_fields = params[:visible_fields].to_s
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile Updated"
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

end
