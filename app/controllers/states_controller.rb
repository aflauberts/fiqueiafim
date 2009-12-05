class StatesController < ApplicationController

  def update_cities

    state = State.find_by_id(params[:state_id])
    cities = state.cities

    render :update do |page|
      page.replace_html 'cities', :partial => 'cities', :object => cities
    end
  end


end
