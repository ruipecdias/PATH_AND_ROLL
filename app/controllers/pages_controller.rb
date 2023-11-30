class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]



  def home
  end

  def dashboard
    @affecting_incidents = current_user.affecting_incidents.limit(3)
    @reported_incidents = current_user.incidents.limit(3)
    # Additional logic for location-based incidents
  end
  
end
