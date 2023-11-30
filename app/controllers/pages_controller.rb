class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]



  def home
  end

  def dashboard
    @affecting_incidents = current_user.affecting_incidents.limit(3)
    @reported_incidents = current_user.incidents.limit(3)
    @incidents = Incident.all
    @markers = @incidents.geocoded.map do |incident|
      {
        lat: incident.latitude,
        lng: incident.longitude,
        url: incident_path(incident),
        marker_html: render_to_string(partial: "marker", locals: { incident: incident })
      }
  end
  
end
end