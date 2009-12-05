class MeetingsController < ApplicationController

  def index
    if current_user
      @meetings = current_user.meetings
    end
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    if current_user
      @meeting.user = current_user
    else
      redirect_to root_path
    end
    if @meeting.save
      flash[:notice] = "Encontro cadastrado."
      redirect_to meetings_path
    else
      render :action => 'new'
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(params[:meeting])
      flash[:notice] = "Encontro alterado com sucesso"
      redirect_to meetings_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    flash[:notice] = "Successfully destroyed clothing type."
    redirect_to meetings_url
  end

end
